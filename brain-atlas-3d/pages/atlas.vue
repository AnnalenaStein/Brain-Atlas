<template>
  <HeaderBar />
  <div class="min-h-screen bg-bg-app text-base relative">
    <!-- <button
      @click="$router.push('/')"
      class="absolute top-4 left-4 z-50 px-4 py-1 bg-tag hover:bg-tagHover text-text-body rounded text-sm"
    >
      ← Back
    </button> -->
    <canvas ref="canvas"></canvas>
    <ControlPanel />
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import * as THREE from 'three'
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import { EffectComposer } from 'three/examples/jsm/postprocessing/EffectComposer'
import { RenderPass } from 'three/examples/jsm/postprocessing/RenderPass'
import { UnrealBloomPass } from 'three/examples/jsm/postprocessing/UnrealBloomPass'

const canvas = ref(null)
const clusters = []

onMounted(() => {
  const scene = new THREE.Scene()
  const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
  camera.position.z = 10

  const renderer = new THREE.WebGLRenderer({ canvas: canvas.value, antialias: true })
  renderer.setSize(window.innerWidth, window.innerHeight)
  renderer.setPixelRatio(window.devicePixelRatio)
  renderer.setClearColor(0x000000)

  const composer = new EffectComposer(renderer)
  composer.addPass(new RenderPass(scene, camera))
  composer.addPass(new UnrealBloomPass(new THREE.Vector2(window.innerWidth, window.innerHeight), 0.01, 0.01, 0.6))

  const ambientLight = new THREE.AmbientLight(0xffffff, 1.0)
  const directionalLight = new THREE.DirectionalLight(0xffffff, 1.8)
  directionalLight.position.set(5, 5, 5)
  scene.add(ambientLight, directionalLight)

  const loader = new GLTFLoader()
  loader.load('/assets/brain_model.gltf', (gltf) => {
    const brain = gltf.scene
    brain.scale.set(0.04, 0.04, 0.04)
    brain.position.set(0, 0, 0)

    brain.traverse((child) => {
      if (child.isMesh) {
        child.material = new THREE.MeshStandardMaterial({
          color: 0xcccccc,
          roughness: 0.9,
          metalness: 0.5,
          transparent: true,
          opacity: 0.7
        })
      }
    })

    scene.add(brain)
  })

  const createGlowMaterial = (colorHex) => new THREE.MeshStandardMaterial({
    color: colorHex,
    emissive: colorHex,
    emissiveIntensity: 20,
    roughness: 0.05,
    metalness: 0.2,
    transparent: true,
    opacity: 0.8
  })

  const createRegionCluster = (center, spread, color, count = 12) => {
    const group = new THREE.Group()
    const baseMaterial = createGlowMaterial(color)

    for (let i = 0; i < count; i++) {
      const offset = new THREE.Vector3(
        (Math.random() - 0.5) * spread,
        (Math.random() - 0.5) * spread,
        (Math.random() - 0.5) * spread
      )
      const sphere = new THREE.Mesh(
        new THREE.SphereGeometry(0.1 + Math.random() * 0.1, 24, 24),
        baseMaterial.clone()
      )
      sphere.position.copy(center.clone().add(offset))
      group.add(sphere)
    }

    scene.add(group)
    clusters.push(group)
  }

  const regions = [
    { center: new THREE.Vector3(0.55, 0.8, 0.05), spread: 0.3, color: 0xffcc00 },
    { center: new THREE.Vector3(-0.55, 0.8, 0.05), spread: 0.3, color: 0xffcc00 },
    { center: new THREE.Vector3(0, 1.05, -0.1), spread: 0.25, color: 0x00ffff },
    { center: new THREE.Vector3(0.3, 0.7, 0.2), spread: 0.25, color: 0x66ff66 },
    { center: new THREE.Vector3(-0.3, 0.7, 0.2), spread: 0.25, color: 0x66ff66 },
    { center: new THREE.Vector3(0.6, 0.9, -0.3), spread: 0.25, color: 0xff99cc },
    { center: new THREE.Vector3(-0.6, 0.9, -0.3), spread: 0.25, color: 0xff99cc },
    { center: new THREE.Vector3(0.2, 0.8, -0.6), spread: 0.25, color: 0xff6600 },
    { center: new THREE.Vector3(-0.2, 0.8, -0.6), spread: 0.25, color: 0xff6600 },
    { center: new THREE.Vector3(0.4, -0.6, -0.6), spread: 0.3, color: 0x9966ff },
    { center: new THREE.Vector3(-0.4, -0.6, -0.6), spread: 0.3, color: 0x9966ff }
  ]

  regions.forEach(region => createRegionCluster(region.center, region.spread, region.color))

  const controls = new OrbitControls(camera, renderer.domElement)
  controls.enableDamping = true
  controls.dampingFactor = 0.05

  function animate() {
    requestAnimationFrame(animate)
    scene.rotation.y += 0.002
    controls.update()
    composer.render()
  }

  animate()
})
</script>

<style>
canvas {
  width: 100%;
  height: 100vh;
  display: block;
  background-color: #000000;
}
</style>
