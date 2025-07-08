<template>
  <div class="main-wrapper">
    <HeaderBar />
    <div class="min-h-screen bg-bg-app text-base relative flex items-center justify-center">
      <div class="video-box">
        <video ref="videoRef" autoplay muted playsinline @ended="playNextVideo" class="video-element">
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

import FilterMenu from '@/components/FilterMenu.vue'


const showFilterMenu = ref(false)

const videoRef = ref(null)

// Liste deiner Videos
const videoSources = [
  '/assets/Gehirn_komplett.mp4',
  '/assets/Gehirn_halb.mp4',
  '/assets/Motor_System.mp4'
]
const currentIndex = ref(0)

// Playback-Rate setzen, sobald Video geladen ist
//   onMounted(() => {
//     if (videoRef.value) {
//       videoRef.value.playbackRate = 0.75
//     }
//   })

let intervalId = null

onMounted(() => {
  const video = videoRef.value
  if (video) {
    video.playbackRate = 0.75
    video.play()
  }

  // Starte Intervall alle 10 Sekunden
  intervalId = setInterval(() => {
    playNextVideo()
  }, 13000)
})

onUnmounted(() => {
  // Intervall aufräumen
  clearInterval(intervalId)
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
  object-fit: cover;
  background-color: var(--bg-app);
}

.main-wrapper {
  background-color: black;
  color: var(--text-body);
  font-family: Inter, sans-serif;
  padding-top: 55px;
}
</style>
  
  