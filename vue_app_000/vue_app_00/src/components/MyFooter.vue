<template>
  <footer>
    <section class="footer-icon">
        <div class="core">
            <ul>
                <li>
                    <i class="icon1"></i>	
                    <strong>品质保障</strong>
                    <p>腕表品牌官方授权</p>
                </li>
                <li>
                    <i class="icon2"></i>	
                    <strong>线下门店遍布全国</strong>
                    <p>近400家自营门店</p>
                </li>
                <li>
                    <i class="icon3"></i>	
                    <strong>全国联保</strong>
                    <p>提供品牌官方保修卡</p>
                </li>
                <li>
                    <i class="icon4"></i>	
                    <strong>售后无忧</strong>
                    <p>全国100多家盛时维修中心</p>
                </li>
             </ul>
        </div>
    </section>
  <section class="footer-message">
        <div class="core">
            <div class="about-us clearfix">
                <div class="about-us-left fl">
                    <p class="tel">400-921-3599</p>
                    <p class="time">周一至周日 9:00-21:00</p>
                    <a href="" class="fl">在线咨询</a>
                </div>
                <div class="about-us-center fl">
                    <dl>
                        <dt v-for="(itemtitle,i) of title" :key="i" >{{itemtitle}}</dt>
                        <dd v-for="(itemone,i) of one" :key="i">
                            <router-link to="">{{itemone}}</router-link>
                        </dd>
                        <dd v-for="(itemtwo,i) of two" :key="i">
                            <router-link to="">{{itemtwo}}</router-link>
                        </dd>
                        <dd v-for="(itemthree,i) of three" :key="i">
                            <router-link to="">{{itemthree}}</router-link>
                        </dd>
                        <dd v-for="(itemfour,i) of four" :key="i">
                            <router-link to="">{{itemfour}}</router-link>
                        </dd>
                    </dl>
                </div>
                <div class="about-us-right fl">
                    <div class="fl">
                        <img src="http://127.0.0.1:8080/image/index/erweima_service.png" alt="">
                        <p>微信服务号</p>
                    </div>
                    <div class="fr">
                        <img src="http://127.0.0.1:8080/image/index/code.png" alt="">
                        <p>扫码盛时APP<br>
                        <span>下载送100积分</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="friendsLink">
                <p>友情链接:</p>
                <div class="friends swiper-container swiper-container-horizontal">
                    <ul v-for="(itemlink,i) of friendslink" :key="i">
                        <li>{{itemlink}}</li>
                    </ul>
                </div>
            </div>
            <p class="company">
                <span>©盛时网2018上海聚鱼网络科技有限公司</span>
                <span>沪ICP备15047505号-1</span>
                <a href="">网络地址</a>
            </p>
            <div class="copyright">
                <ul class="clearfix">
                    <li class="licence">
                        <a href="">
                            <img src="http://127.0.0.1:8080/image/index/lz.png" alt="">
                        </a>
                    </li>
                    <li class="auth">
                        <a href="">
                            <b id="aqLogoHVBDC"></b>
                            <img src="http://127.0.0.1:8080/image/index/hy_83x30.png" alt="">
                        </a>
                    </li>
                    <li class="police">
                        <a href="">
                            <img src="http://127.0.0.1:8080/image/index/beianbgs-30.png" alt="">
                            <p>沪公网安备</p>
                            <p>31010602000658</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</footer>
</template>
<script>
export default {
    data(){
        return{
            title:["关于盛时","在线购物","网点","其他"],
            one:["关于盛时","预付定金","线下门店","售后政策"],
            two:["加入盛时","支付方式","维修门店","常见问题"],
            three:["商务合作","配送条款","","友情链接"],
            four:["法律条款","","","热门专题"],
            friendslink:["优格运动","钻石网","钟表网","加盟问答","天天特价","征婚","腕表"]

        }
    }
}
</script>
<style>
    @import url(../assets/css/MyFooter.css);
    @import url(../assets/css/common.css);
    @import url(../../public/css/normalize.css);
</style>


