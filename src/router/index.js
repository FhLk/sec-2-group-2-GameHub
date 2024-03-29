import {createRouter, createWebHashHistory} from 'vue-router'
import PickupGame from '../components/Front-Game-Hub/BasePickupGame.vue'
import Register from '../components/Front-Game-Hub/Register.vue'
import Login from '../components/Front-Game-Hub/Login.vue'
import Profile from '../components/Front-Game-Hub/Profile.vue'
import MatchingGame from '../components/Maching-Game/MatchingGame.vue'
import BlackJackGame from '../components/BlackJack-Game/BlackJack-Game.vue'
import Leaderboard from '../components/Front-Game-Hub/Leaderboard.vue'
import AreaGame from '../components/Area-Game/GamePlay.vue'
const routes = [
  { path: '/', component: PickupGame },
  { path: '/register', component: Register },
  { path: '/login', component: Login },
  { path: '/profile', component: Profile },
  { path: '/matching',component: MatchingGame },
  { path: '/blackjack',component: BlackJackGame },
  { path: '/leaderboard',component: Leaderboard },
  { path: '/area',component: AreaGame}
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