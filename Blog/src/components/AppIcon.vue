<script setup>
defineProps({
  name: { type: String, required: true },
  size: { type: [Number, String], default: 20 }
})
</script>

<template>
  <svg
    class="icon"
    :style="{ width: size + 'px', height: size + 'px' }"
    aria-hidden="true"
    focusable="false"
  >
    <use :xlink:href="'#' + name" :href="'#' + name"></use>
  </svg>
</template>