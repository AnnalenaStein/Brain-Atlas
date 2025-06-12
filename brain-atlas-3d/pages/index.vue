<template>
  <div class="flex flex-col items-center justify-center min-h-screen bg-black text-white px-4">
    <h1 class="text-3xl md:text-5xl font-semibold mb-6 text-center">Explore Brain Activity</h1>

    <div class="w-full max-w-xl mb-4">
      <label class="block text-sm text-gray-400 mb-1" for="activityInput">
        Type in an activity to view brain responses
      </label>
      <input
        id="activityInput"
        v-model="searchQuery"
        type="text"
        placeholder="Playing an Instrument"
        @keyup.enter="handleEnter"
        class="w-full px-4 py-2 rounded-md bg-black border border-gray-600 text-white focus:outline-none focus:ring-2 focus:ring-white placeholder-gray-500"
      />
    </div>

    <div class="mb-6 w-full max-w-xl text-left">
      <p class="text-sm text-gray-400 mb-2">Popular Activity</p>
      <div class="flex flex-wrap justify-start gap-2">
        <button
          v-for="item in popularActivities"
          :key="item"
          @click="searchQuery = item"
          class="px-3 py-1 rounded bg-gray-800 hover:bg-gray-700 text-white text-sm"
        >
          {{ item }}
        </button>
      </div>
    </div>

    <button
      class="text-sm text-white flex items-center gap-1 hover:underline"
      @click="uploadDICOM"
    >
      <span class="text-xl">+</span> Upload DICOM
    </button>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const searchQuery = ref('')
const popularActivities = [
  'Mathematics',
  'Talking',
  'Sports',
  'Reading',
  'Playing Chess'
]

const uploadDICOM = () => {
  alert('Upload DICOM functionality coming soon')
}

const handleEnter = (e: KeyboardEvent) => {
  if (e.key === 'Enter' && searchQuery.value.trim()) {
    router.push({ path: '/atlas', query: { q: searchQuery.value } })
  }
}
</script>
