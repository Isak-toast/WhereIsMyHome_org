import Vue from 'vue'
import VueRouter from 'vue-router'
import AppMain from "@/views/AppMain";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'main',
    component: AppMain,
  },
  {
    path: '/house',
    name: 'house',
    component: () => import("@/views/AppHouse"),
  },
  {
    path: '/deal',
    name: 'deal',
    component: () => import("@/views/AppDeal"),
  },
  {
    path: '/board',
    name: 'board',
    component: () => import("@/views/AppBoard"),
    redirect: "/board/list",
    children: [
      {
        path: "list",
        name: "boardlist",
        component: () => import("@/components/board/BoardList"),
      },
      {
        path: "write",
        name: "boardwrite",
        component: () => import("@/components/board/BoardWrite"),
      },
      {
        path: "detail/:articleno",
        name: "boarddetail",
        component: () => import("@/components/board/BoardDetail"),
      },
      {
        path: "edit",
        name: "boardedit",
        component: () => import("@/components/board/BoardEdit"),
      },
      {
        path: "delete/:articleno",
        name: "boarddelete",
        component: () => import("@/components/board/BoardDelete"),
      },
    ],
  },
  {
    path: '/notice',
    name: 'notice',
    component: () => import("@/views/AppNotice"),
  },
  {
    path: '/user',
    name: 'user',
    component: () => import("@/views/AppUser"),
    
    children: [
      {
        path: "join",
        name: "join",
        component: () => import("@/components/user/UserRegister"),
      },
      {
        path: "login",
        name: "login",
        component: () => import("@/components/user/UserLogin"),
      },
    ],
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
