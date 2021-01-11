<template>
  <div class="figure">
    <div class="fg">
      <div class="fgimg">
        <iframe
          v-if="isHtml"
          :src="htmlSrc"
          ref="frame"
          seamless
          frameborder="0"
          scrolling="no"
          @load="frameAdapt"
        />
        <img v-if="!isHtml" :src="pngSrc" />
      </div>
    </div>
    <div class="fgtitle">
      <p>
        图 {{figure}}：
        <slot></slot>
      </p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: ["figure", "type", "locate"],
  data() {
    return {
      pngSrc: "",
      htmlSrc: "",
      isHtml: false
    };
  },
  mounted() {
    this.locateResources();
  },
  methods: {
    locateResources() {
      let tmp = this.figure.split("-");
      // if (this.type === "png") {
      //   this.isHtml = false;
      // } else {
      //   this.isHtml = true;
      // }

      // if (this.isHtml) {
      this.htmlSrc =
        'https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/' + this.locate + "/htmlfigures/ch" + tmp[0] + "/fg" + this.figure + ".html";
      // } else {
      const suffix = this.type ? this.type : 'png'
      this.pngSrc = 'https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/' + this.locate + "/figures/ch" + tmp[0] + "/fg" + this.figure + "." + suffix;
      console.log('Figures.vue', this.pngSrc)
      // }
    },
    frameAdapt() {
      const frame = this.$refs.frame;
      const doc = frame.contentWindow.document.body;
      frame.width = doc.scrollWidth;
      frame.height = doc.scrollHeight;
      doc.style.margin = "0";
    }
    // jumpToHtml() {
    //   let tmp = this.figure.split("-");
    //   if (tmp[0] === "17") {
    //     window.open(
    //       'https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/' + this.locate + "/htmlfigures/ch17/index.html"
    //     );
    //   } else if (tmp[0] === "18") {
    //     window.open(
    //       'https://yuki-1252851979.cos.ap-nanjing.myqcloud.com/docs/' + this.locate + "/htmlfigures/ch18/index.html"
    //     );
    //   } else {
    //     axios
    //       .get(this.htmlSrc)
    //       .then(resp => {
    //         if (resp) {
    //           window.open(this.htmlSrc);
    //         }
    //       })
    //       .catch(e => {
    //         console.log("抱歉，没有找到此图片对应的 HTML 页面！");
    //       });
    //   }
    // }
  }
};
</script>

<style scoped>
.fg {
  border-radius: 6px;
  border-width: 2px;
  border-style: solid;
  border-color: black;
  margin: 0 auto;
  width: 100%;
}
.fgimg {
  padding: 4px 24px 0;
}
.fgtitle {
  text-align: center;
  font-weight: bold;
}
</style>
