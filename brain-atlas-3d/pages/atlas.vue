<template>
  <div class="min-h-screen bg-bg-app text-base relative">
    <button
      @click="$router.push('/')"
      class="absolute top-4 left-4 z-50 px-4 py-1 bg-tag hover:bg-tagHover text-text-body rounded text-sm"
    >
      ← Back
    </button>
    <canvas ref="canvas"></canvas>
    <ControlPanel />
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import * as THREE from 'three'
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'

const canvas = ref(null)

onMounted(() => {
  const scene = new THREE.Scene()
  const camera = new THREE.PerspectiveCamera(
    75,
    window.innerWidth / window.innerHeight,
    0.1,
    1000
  )
  camera.position.z = 10

  const renderer = new THREE.WebGLRenderer({ canvas: canvas.value, antialias: true })
  renderer.setSize(window.innerWidth, window.innerHeight)
  renderer.setPixelRatio(window.devicePixelRatio)
  renderer.setClearColor(0x0b0b0c) // Hintergrundfarbe passend zu bg-app

  const ambientLight = new THREE.AmbientLight(0xffffff, 0.6)
  const directionalLight = new THREE.DirectionalLight(0xffffff, 1)
  directionalLight.position.set(5, 5, 5)
  scene.add(ambientLight, directionalLight)

  const axesHelper = new THREE.AxesHelper(5)
  scene.add(axesHelper)

  const loader = new GLTFLoader()
  loader.load('/assets/brain_model.gltf', (gltf) => {
    console.log('Gehirnmodell geladen:', gltf)

    const brain = gltf.scene
    brain.scale.set(0.04, 0.04, 0.04)
    brain.position.set(0, 0, 0)

    brain.traverse((child) => {
      if (child.isMesh) {
        const baseColor = 0x4477ff
        const color = child.name.toLowerCase().includes('cortex') ? 0xff4444 : baseColor

        child.material = new THREE.MeshStandardMaterial({
          color: color,
          roughness: 0.6,
          metalness: 0.1,
          transparent: true,
          opacity: 0.7
        })
      }
    })

    scene.add(brain)
  })

  const controls = new OrbitControls(camera, renderer.domElement)
  controls.enableDamping = true
  controls.dampingFactor = 0.05

  function animate() {
    requestAnimationFrame(animate)
    scene.rotation.y += 0.002
    controls.update()
    renderer.render(scene, camera)
  }

  animate()
})
</script>

<style>
canvas {
  width: 100%;
  height: 100vh;
  display: block;
  background-color: #0b0b0c; /* passend zu --bg-app */
}
</style>
