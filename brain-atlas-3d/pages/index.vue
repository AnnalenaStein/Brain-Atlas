<template>
    <div>
        <canvas ref="canvas"></canvas>
    </div>
</template>
  
<script setup>
import { onMounted, ref } from 'vue'
import * as THREE from 'three'
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader'

const canvas = ref(null)

onMounted(() => {
    const scene = new THREE.Scene()
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
    camera.position.z = 5

    const renderer = new THREE.WebGLRenderer({ canvas: canvas.value, antialias: true })
    renderer.setSize(window.innerWidth, window.innerHeight)

    // Licht hinzufügen (damit Gehirn sichtbar wird)
    const light = new THREE.AmbientLight(0xffffff, 1)
    scene.add(light)

    const axesHelper = new THREE.AxesHelper(5)
    scene.add(axesHelper)

    // Gehirnmodell laden
    const loader = new GLTFLoader()
    loader.load('/assets/brain_model.gltf', (gltf) => {
        console.log('Gehirnmodell geladen:', gltf)

        const brain = gltf.scene
        console.log('Alle Kinder:', brain.children)

        brain.scale.set(50, 50, 50)
        brain.position.set(0, 0, 0)

        brain.traverse((child) => {
            if (child.isMesh) {
                console.log('Gefundener Mesh:', child.name)
                child.material.transparent = false
                child.material.opacity = 1
            }
        })

        scene.add(brain)
    })




    // Animation
    function animate() {
        requestAnimationFrame(animate)
        scene.rotation.y += 0.002 // Szene langsam drehen
        renderer.render(scene, camera)
    }

    animate()
})
</script>
  
<style>
/* Canvas nimmt den ganzen Bildschirm */
canvas {
    width: 100%;
    height: 100vh;
    display: block;
}
</style>
  