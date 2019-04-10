
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
import { Form, HasError, AlertError } from 'vform'
window.Form = Form;
import Gate from './Gate'
Vue.prototype.Gate = new Gate(window.user);


Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)
Vue.component('pagination', require('laravel-vue-pagination'));

import VueRouter from 'vue-router'
import moment from 'moment'

import swal from 'sweetalert2'
window.swal = swal;

const toast = swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000
});

window.toast = toast;
window.fire = new Vue();

Vue.use(VueRouter)

import VueProgressBar from 'vue-progressbar'

Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '5px'
})


Vue.filter('upperCase', function(text){
	return text.charAt(0).toUpperCase() + text.slice(1);
});

Vue.filter('diffForHumans', function(text){
	return moment(text).format("MMM Do YY");
});

const routes = [
  { path: '/dashboard', component: require('./components/DashboardComponent.vue').default },
  { path: '/developer', component: require('./components/DeveloperComponent.vue').default },
  { path: '/users', component: require('./components/UsersComponent.vue').default },
  { path: '/subscribers', component: require('./components/SubscribersComponent.vue').default },
  { path: '/profile', component: require('./components/ProfileComponent.vue').default },
  { path: '*', component: require('./components/NotFoundComponent.vue').default }
]

const router = new VueRouter({
	mode:'history',
  routes // short for `routes: routes`
})

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('passport-clients', require('./components/passport/Clients.vue').default
);

Vue.component('passport-authorized-clients', require('./components/passport/AuthorizedClients.vue').default
);

Vue.component('passport-personal-access-tokens', require('./components/passport/PersonalAccessTokens.vue').default
);
Vue.component('not-found', require('./components/NotFoundComponent.vue').default);
Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router
});
