<template>
  <div class="container h-100 w-100">
    <div class="text-right p-10">
      <locale-selector></locale-selector>
    </div>
    <div class="login-dev bg-white b-radius-5 text-center">
      <h3>{{ dict.app_name }}</h3>
      <el-form ref="loginForm" :model="form">
        <el-form-item prop="username" :rules="usernameRules">
          <el-input prefix-icon="el-icon-user-solid" :placeholder="dict.login_username" v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item prop="password" :rules="passwordRules">
          <el-input prefix-icon="el-icon-lock" :type="passwordType" :placeholder="dict.login_password" v-model="form.password">
          </el-input>
          <i v-if="isRegister" :class="viewIconClass" @click="showPassword=!showPassword"></i>
        </el-form-item>
        <!-- 需要用fragment，el表单校验不支持v-if动态添加 -->
        <fragment v-if="isRegister">
          <el-form-item :rules="passwordConfirmRules" prop="passwordConfirm">
            <el-input prefix-icon="el-icon-lock" :type="passwordType" :placeholder="dict.login_password_confirm" v-model="form.passwordConfirm"></el-input>
            <i v-if="isRegister" :class="viewIconClass" @click="showPassword=!showPassword"></i>
          </el-form-item>
        </fragment>

        <el-form-item prop="vcode">
          <el-col :span="8">
            <el-input class="" maxlength="6" v-model="form.vcode" :placeholder="dict.vcode"></el-input>
          </el-col>
          <el-col :span="11">
            <el-image style="width: 100px;" :src="vcodeUrl"></el-image>
          </el-col>
          <el-col :span="4">
            <a @click="reloadVCode">换一张</a>
          </el-col>
        </el-form-item>

        <el-form-item v-if="!isRegister" class="text-left">
            <el-checkbox v-model="form.rememberMe" :label="dict.remember_me"></el-checkbox>
        </el-form-item>
        <el-form-item v-if="!isRegister">
          <el-button :loading="loading" class="w-100" type="primary" @click="doLogin">{{ dict.login }}</el-button>
          <span><a @click="changeForm">{{ dict.to_register }}</a></span>
        </el-form-item>
        <el-form-item v-if="isRegister">
          <el-button :loading="loading" class="w-100" type="primary" @click="doRegister">{{ dict.register }}</el-button>
          <span>{{ dict.to_login }}<a @click="changeForm">{{ dict.login }}</a></span>
        </el-form-item>
      </el-form>
    </div>
  </div>

</template>

<script>
import LocaleSelector from '@/components/LocaleSelector'
import { login, register } from '@/api/login'
import { AuthUtils } from '@/utils'
import mixins from '@/mixins'

export default {
  components: {
    LocaleSelector
  },
  mixins: [
    mixins,
  ],
  data(){
    return {
      form: {
        username: '',
        password: '',
        passwordConfirm: '',
        rememberMe: false,
        type: 'USERNAME',
        vcode: ''
      },
      isRegister: false,
      showPassword: false,
      v: 0
    }
  },
  computed: {
    usernameRules() {
      return [
        { required: true, message: this.dict.v_required, trigger: 'blur' }
      ]
    },
    passwordRules() {
      return [
        { required: true, message: this.dict.v_required, trigger: 'blur' }
      ]
    },
    passwordConfirmRules() {
      let validatePasswordConfirm = (rule, value, callback) => {
        if(value === '')
          callback(new Error(this.dict.v_required));
        else if(value !== this.form.password)
          callback(new Error(this.dict.v_password_conflict));
        else
          callback();
      }
      return [
          { validator: validatePasswordConfirm, trigger: 'blur' }
        ]
    },

    viewIconClass() {
      return {
        'el-icon-view': true,
        'cursor-p': true,
        'active': this.showPassword
      }
    },
    passwordType(){
      return this.showPassword ? 'text' : 'password';
    },
    vcodeUrl() {
      return '/api/vcode?v=' + this.v;
    }

  },
  methods: {
    doLogin() {
      this.doSubmit(login, (resp) => {
        AuthUtils.setToken(resp.data, this.form.rememberMe);
      })
    },
    doRegister() {
      this.doSubmit(register, (resp) => {
        this.$notify({
          title: this.dict.register_success,
          type: 'success'
        });
        AuthUtils.setToken(resp.data) ;
      })
    },
    doSubmit(submitFunc, callback) {
      this.$refs['loginForm'].validate(valid => {
        if(!valid) //校验不通过
          return;
        this.loading = true;
        submitFunc(this.form).then(resp => {
          if(resp.code === '000000') {
            callback(resp);
            this.$router.replace({path: this.$route.query.redirect || '/'});
          } else {
            this.$notify.error({
              title: resp.msg
            })
          }
          this.loading = false;
        }).catch(err => {
          console.log(err);
          this.loading = false;
        })
      })
    },

    changeForm() {
      this.isRegister=!this.isRegister;
      this.showPassword=false;
      this.$refs['loginForm'].resetFields();
    },

    reloadVCode() {
      this.v = Math.random();
    }

  }

}

</script>

<style scoped>
.container{
  background: url('../../assets/bg.jpg') no-repeat;
  background-size: 100% 100%;
}
.login-dev{
  width: 300px;
  position: absolute;
  top: 200px;
  left: 40%;
  padding: 0 30px;
}
.el-icon-view{
  position: absolute;
  top: 13px;
  right: 10px;
  font-size: 16px;
}
.el-icon-view.active{
  color: #409eff;
}
a{
  color: #409eff;
  text-decoration: underline;
}
a:hover{
  cursor: pointer;
}
.vcode{
  width: 120px;
  left: -60px;
}

</style>
