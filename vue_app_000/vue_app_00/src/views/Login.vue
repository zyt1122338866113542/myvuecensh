<template>
  <div class="contain">
		<div class="header">
			<div class="img">
				<img src="http://127.0.0.1:8080/image/login/logo.png" alt="">
				<h3>
					<a href="#" class="download">下载盛世APP</a>
				</h3>
			</div>
		</div>
		<div class="container">
			<div class="letf-img">
				<img src="http://127.0.0.1:8080/image/login/login_bg.jpg" alt="">
			</div>
			<div class="login-content" id="loginContent">
				<div class="login-content-btns">
					<div class="item" :class="show==false? 'on': ''" id="newLogin" @click="phonelogin">手机号登录</div>
					<div class="item" :class="show==true? 'on': ''"  id="oldLogin" @click="pwdlogin">账号登录</div>
				</div>
				<div class="login-content-view">
					<div class="item " v-if="show==false" >
							<div class="login-content-inputBox username">
								<input type="text" name="old_name" placeholder="请输入手机号"  id="uname">
							    <input type="button"  value="获取验证码" id="getSMS">
								<div class="login-content-inputBox-msg"></div>
							</div>
							<div class="login-content-inputBox SMSCode">
								<input type="text" name="ucode" value=""  placeholder="请输入短信验证码"  id="ucode" maxlength="6">
								<div class="login-content-inputBox-msg"></div>
							</div>
							<div class="login-content-inputBox submit">
								<input type="button" id="submit" value="注册&登录">
							</div>
							<div class="login-content-agreement">
								<input type="checkbox" checked="checked" id="uagree">
								<label for="uagree">
									继续操作则默认视为您已同意
									<a href="">《盛时网用户注册协议》</a>
								</label>
							</div>
						</div>
					</div>
					<div class="item" v-if="show==true" >
							<div class="login-content-inputBox other">
								<input type="text" name="old_name" placeholder="请输入手机号"  id="uname" maxlength="12" v-model="uname">
								<span v-show="show">{{messagephone}}</span>
								<div class="login-content-inputBox-msg"></div>
							</div>
							<div class="login-content-inputBox password">
								<input type="password" name="old_pwd" value=""  placeholder="请输入密码"  id="upwd" maxlength="6" v-model="upwd">
								
								<span v-show="show">{{messagepwd}}</span>
								<div class="login-content-inputBox-msg"></div>
							</div>
							<div class="login-content-inputBox submit">
								<input type="button" id="osubmit" value="登录" @click="login">
								<span v-show="show">{{messageerr}}</span>
							</div>
							<div class="login-content-forget">
								<a href="">忘记密码?</a>
							</div>
						</div>

						<div class="login-other">
					<div class="headline"><p>使用第三方登录</p></div>
						<div class="three">
							<ul>
								<li class="wechat">
									<span id="wxLoginBtn"></span>
									<p>微信</p>
								</li>
								<li class="weibo">
									<span id="wbLoginBtn"></span>
									<p>微博</p>
								</li>
								<li class="qq">
									<span id="qqLoginBtn"></span>
									<p>QQ</p>
								</li>
							</ul>
						</div>						
				</div>

			</div>
		</div>						
	</div>
</template>
<script>
  export default {
		data(){
			return{
				show:false,
       			uname:"",
				upwd:"",
				messagephone:"",
				messagepwd:"",
				messageerr:""
     		}
		},
		methods:{
			login(){
				var uname=this.uname;
				var upwd=this.upwd;
				var reg=/^[a-z0-9]{3,12}$/i;
				if(!reg.test(uname)){
						this.show=true;
						this.messagephone="用户名不能为空";
						return;
				}
				if(!reg.test(upwd)){
						this.show=true;
						this.messagepwd="密码不能为空";
						return;
				}
				this.axios.get(
					"Login",
					{
						params:{
						uname,
						upwd
						}
					}
				).then(result=>{
					if(result.data.code==1){
							//成功，跳转
							this.$router.push("/index");
							this.$store.commit("updateUname",this.uname);
					}else{
							//失败，提示
							this.show=true;
							this.messageerr = "登陆失败"
					}
					this.uname="";
					this.upwd=""; 
				})
			},
			phonelogin(){
				this.show=false;
			},
			pwdlogin(){
			  this.show=true;
			},
		}
	}
</script>
<style>
@import url(../assets/css/login.css);
</style>
