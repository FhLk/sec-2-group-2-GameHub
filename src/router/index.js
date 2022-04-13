// 1. Define route components.
// These can be imported from other files
import {createRouter, createWebHashHistory} from 'vue-router'
import AppHome from '../App.vue'
import PickupGame from '../components/Front-Game-Hub/BasePickupGame.vue'
import Register from '../components/Front-Game-Hub/Register.vue'
import Login from '../components/Front-Game-Hub/Login.vue'
import Profile from '../components/Front-Game-Hub/Profile.vue'

// 2. Define some routes
// Each route should map to a component.
// We'll talk about nested routes later.
const routes = [
  { path: '/', component: PickupGame },
  { path: '/register', component: Register },
  { path: '/login', component: Login },
  { path: '/profile', component: Profile },
]

// 3. Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = createRouter({
  // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
  history: createWebHashHistory(),
  routes, // short for `routes: routes`
})

export default router;