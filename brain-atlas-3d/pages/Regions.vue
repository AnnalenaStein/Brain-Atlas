<template>
    <div class="main-wrapper">
      <HeaderBar />
      <div class="min-h-screen bg-bg-app text-base relative flex items-center justify-center">
      <div class="video-box">
        <video
          ref="videoRef"
          autoplay
          muted
          playsinline
          @ended="playNextVideo"
          class="video-element"
        >
          <source :src="videoSources[currentIndex]" type="video/mp4" />
          Your browser does not support the video tag.
        </video>
      </div>
  
        <ControlPanel />
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted, watch } from 'vue'
  import HeaderBar from '@/components/HeaderBar.vue'
  import ControlPanel from '@/components/ControlPanel.vue'
  
  const videoRef = ref(null)
  
  // Liste deiner Videos
  const videoSources = [
    '/assets/Gehirn_komplett.mp4',
    '/assets/Motor_System.mp4',
    '/assets/Motor_System_hover.mp4'
  ]
  const currentIndex = ref(0)
  
  // Playback-Rate setzen, sobald Video geladen ist
  onMounted(() => {
    if (videoRef.value) {
      videoRef.value.playbackRate = 0.75
    }
  })
  
  // Wenn sich das Video ändert, erneut abspielen
  watch(currentIndex, () => {
    const video = videoRef.value
    if (video) {
      video.load()
      video.play()
      video.playbackRate = 0.75
    }
  })
  
//   // Zum nächsten Video springen
  const playNextVideo = () => {
    currentIndex.value = (currentIndex.value + 1) % videoSources.length
  }
  </script>
  
  <style scoped>
  .video-box {
    width: 1000px;
    position: relative;
  }
  
  .video-element {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .main-wrapper {
    background-color: black;
  }
  </style>
  