<template>
  <div class="flex pic-container">
    <div class="gif-div" v-for="(pic, idx) in pics" :key="idx">
      <img @mouseover="showGif(idx)" :src="pic" @error="handleErr(idx)">
    </div>

  </div>


</template>

<script>
export default {
  data() {
    return {
      pics: [
        '/api/static/pic/g1.png',
        '/api/static/pic/g2.png',
        '/api/static/pic/g2.png',
        '/api/static/pic/g1.png',
        '/api/static/pic/g2.png',
        '/api/static/pic/g2.png',
        '/api/static/pic/g1.png',
        '/api/static/pic/g1.png',
        '/api/static/pic/g2.png',
        '/api/static/pic/g2.png',
        '/api/static/pic/g1.png',
      ]
    }
  },
  methods: {
    handleErr(idx) {
      this.$set(this.pics, idx, this.pics[idx].replace(/png$/, 'gif'));
    },
    showGif(idx) {
      if(/png$/.test(this.pics[idx]))
        this.$set(this.pics, idx, this.pics[idx].replace(/png$/, 'gif'));
    },

  }

}


</script>

<style scoped>
.pic-container{
  align-items:baseline;
  justify-content:space-around;
  flex-wrap: wrap;
}
-div{
  min-width: 100px;
  max-width: 300px;
  min-height: 100px;
  max-height: 300px;
}
-div img{
  width: 100%;
  height: auto;
}
</style>
