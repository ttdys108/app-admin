<template>
  <div>
    <div>
      <aplayer :music="musicList[0]"
               showLrc
               :list="musicList"
               :volume="0.5"
      ></aplayer>

    </div>


  </div>

</template>

<script>
import Aplayer from 'vue-aplayer'
Aplayer.disableVersionBadge = true;

export default {
  components: {
    Aplayer,
  },
  data() {
    return {
      musicList: [
        {
          src: '/api/static/music/阿里阿里.mp3',
          title: '阿里阿里',
          artist: '李贞贤',
          pic: '/api/static/pic/hjr.jpg'
        },
        {
          src: '/api/static/music/冰淇淋爱情.mp3',
          title: '冰淇淋爱情',
          artist: '任炳洙',
          pic: '/api/static/pic/hjr.jpg'
        },
        {
          src: '/api/static/music/成都.mp3',
          title: '成都',
          lrc: process.env.API_HOST + '/static/music/Lyric/成都.lrc', //http开头组件才识别
          artist: '赵雷',
          pic: '/api/static/pic/hjr.jpg'
        },
      ]

    }

  }



}

</script>
