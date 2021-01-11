<template>
  <div class="fgimg">
    <img :src="pngSrc" />
  </div>
</template>

<script>
export default {
  props: ["figure", "type", "locate"],
  data() {
    return {
      pngSrc: ""
    };
  },
  mounted() {
    this.locateResources();
  },
  methods: {
    locateResources() {
      console.log(this.figure, 'Figures.vue')
      let tmp = this.figure.split("-");
      // const suffix = this.type ? this.type : 'png'
      this.pngSrc = 'https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/' + this.locate  + this.figure ;
      console.log(' this.pngSrc', this.pngSrc)
    }
  }
}
</script>
