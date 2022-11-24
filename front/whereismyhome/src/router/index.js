import Vue from "vue";
import VueRouter from "vue-router";
import AppMain from "@/views/AppMain";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "main",
    component: AppMain,
  },
  {
    path: "/house",
    name: "house",
    component: () => import("@/views/AppHouse"),
  },
  {
    path: "/deal",
    name: "deal",
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
      
    ],
  },
  {
    path: '/notice',
    name: 'notice',
    component: () => import("@/views/AppNotice"),
    redirect: "/notice/list",
    children: [
      {
        path: "list",
        name: "noticelist",
        component: () => import("@/components/notice/NoticeList"),
      },
    ],
  },
  {
    path: "/user",
    name: "user",
    component: () => import("@/views/AppUser"),
    children: [
      {
        path: "signup",
        name: "signup",
        component: () => import("@/components/user/UserSignup")
      },
      {
        path: "signin",
        name: "signin",
        component: () => import("@/components/user/UserSignin")
      }
    ]
  }
]

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
