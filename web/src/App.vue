<template>
  <div>
    <h1>Hello World</h1>
    <p>ENV: {{ envValue }}</p>

    <button @click="handleGetData">Get Data</button>
    <p>Data: {{ data }}</p>
  </div>
</template>

<script setup lang="ts">
  import { ref } from 'vue';

  const envValue = import.meta.env.VITE_SOME

  const data = ref<any>(null);

  const handleGetData = async () => {
    const response = await fetch('/api/v1/test');
    data.value = await response.json();
    console.log(data);
  }
</script>