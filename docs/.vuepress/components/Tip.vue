<template>
  <div class="tip">
    <img :src="imgSrc">
    <span>
        <slot></slot>
    </span>
    <span>
        <slot name="translation"></slot>
    </span>
  </div>
</template>

<script>
export default {
  props: ["tips"],
  data() {
    return {
      imgSrc: ""
    };
  },
  created() {
    this.chooseTip();
  },
  methods: {
    chooseTip() {
      if (this.tips === "blue") {
        this.imgSrc = "https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/doc-csstdg4/note.png";
      } else if (this.tips === "green") {
        this.imgSrc = "https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/doc-csstdg4/tip.png";
      } else if (this.tips === "orange") {
        this.imgSrc = "https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/doc-csstdg4/warn.png";
      }
      console.log('tip', this.imgSrc)
    }
  }
};
</script>

<style scoped>
tip {
    width: 100%
}
img {
    width: 12%;
    float: left;
}
p { 
  overflow-wrap: break-word
}
</style>
