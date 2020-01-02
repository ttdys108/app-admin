<template>
  <div class="video-container">
    <div class="video-div">
      <video style="object-fit: fill;" width="100%" height="100%" controls src="/api/static/video/v1.mp4"></video>
    </div>
    <div>b</div>

  </div>

</template>

<script>
export default {



}


</script>

<style scoped>
.video-container{
  display: flex;
  align-items:baseline;
  justify-content:space-around;
  flex-wrap: wrap;
}
.video-div{
  width: 400px;
  height: 260px;
}

</style>
