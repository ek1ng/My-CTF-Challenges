"use strict";(self["webpackChunkGopherShop"]=self["webpackChunkGopherShop"]||[]).push([[380],{5380:function(e,t,a){a.r(t),a.d(t,{default:function(){return F}});var r=a(4991);function n(e,t,a,n,s,l){const u=(0,r.up)("Header"),o=(0,r.up)("el-col"),c=(0,r.up)("el-row"),i=(0,r.up)("ProductList"),d=(0,r.up)("InventorySum");return(0,r.wg)(),(0,r.iD)("div",null,[(0,r.Wm)(c,null,{default:(0,r.w5)((()=>[(0,r.Wm)(o,{span:24},{default:(0,r.w5)((()=>[(0,r.Wm)(u)])),_:1})])),_:1}),(0,r.Wm)(c,null,{default:(0,r.w5)((()=>[(0,r.Wm)(o,{span:12},{default:(0,r.w5)((()=>[(0,r.Wm)(i)])),_:1}),(0,r.Wm)(o,{span:12},{default:(0,r.w5)((()=>[(0,r.Wm)(d)])),_:1})])),_:1})])}var s=a(4399);const l=e=>((0,r.dD)("data-v-1ba36793"),e=e(),(0,r.Cn)(),e),u={class:"header"},o={class:"title"},c=l((()=>(0,r._)("span",{style:{"font-size":"56px","font-weight":"600",color:"#303133"}}," Gopher Shop ",-1))),i={class:"info"};function d(e,t,a,n,l,d){const p=(0,r.up)("el-image"),m=(0,r.up)("el-button"),h=(0,r.up)("el-descriptions-item"),g=(0,r.up)("el-descriptions");return(0,r.wg)(),(0,r.iD)("div",null,[(0,r._)("div",u,[(0,r._)("div",o,[(0,r.Wm)(p,{class:"mr-3",style:{height:"54px"},src:"https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301221444991.png"}),c,(0,r.Wm)(p,{class:"mr-3",style:{height:"54px"},src:"https://ek1ng-typora.oss-cn-hangzhou.aliyuncs.com/img/202301221444991.png"})]),(0,r._)("div",i,[(0,r.Wm)(g,{column:3,size:e.large,border:""},{extra:(0,r.w5)((()=>[(0,r.Wm)(m,{type:"info",plain:"",onClick:t[0]||(t[0]=e=>d.sleep())},{default:(0,r.w5)((()=>[(0,r.Uk)("Sleep")])),_:1}),(0,r.Wm)(m,{type:"primary",plain:"",color:"#009FE9",onClick:t[1]||(t[1]=e=>d.buyInventory())},{default:(0,r.w5)((()=>[(0,r.Uk)("Buy Inventory")])),_:1}),(0,r.Wm)(m,{type:"danger",plain:"",onClick:t[2]||(t[2]=e=>d.checkFlag())},{default:(0,r.w5)((()=>[(0,r.Uk)("Check Flag")])),_:1})])),default:(0,r.w5)((()=>[(0,r.Wm)(h,{label:"Vidar Coin",align:"center"},{default:(0,r.w5)((()=>[(0,r.Uk)((0,s.zw)(this.balance),1)])),_:1}),(0,r.Wm)(h,{label:"Days",align:"center"},{default:(0,r.w5)((()=>[(0,r.Uk)((0,s.zw)(this.days),1)])),_:1}),(0,r.Wm)(h,{label:"Inventory",align:"center"},{default:(0,r.w5)((()=>[(0,r.Uk)((0,s.zw)(this.inventory),1)])),_:1})])),_:1},8,["size"])])])])}a(768);var p=a(1611),m=a(1715),h=a(1633),g={name:"ShopHeader",data(){return{balance:0,days:0,inventory:0,intervalId:null}},mounted(){this.getUserInfo(),this.intervalId=setInterval(this.getUserInfo,1e3)},beforeUnmount(){clearInterval(this.intervalId)},methods:{getUserInfo(){p.Z.get("/api/v1/user/info").then((e=>{this.balance=e.data.balance,e.data.message&&e.data.message.includes("no days left")&&((0,m.bM)({title:"Error",message:e.data.message,type:"error"}),this.$router.push("/")),this.days=e.data.days,this.inventory=e.data.inventory})).catch((()=>{(0,h.z8)({type:"error",message:"Get User Info Failed!"})}))},buyInventory(){p.Z.get("/api/v1/user/buyInventory").then((()=>{(0,h.z8)({type:"success",message:"Buy Inventory Successfully!"})})).catch((()=>{(0,h.z8)({type:"error",message:"Buy Inventory Failed!"})}))},sleep(){p.Z.get("/api/v1/user/tanking").then((()=>{(0,h.z8)({type:"success",message:"Sleep Successfully!"})})).catch((()=>{(0,h.z8)({type:"error",message:"Sleep Failed!"})}))},checkFlag(){p.Z.get("/api/v1/user/checkFlag").then((e=>{(0,h.z8)({type:"success",message:e.data.message})})).catch((()=>{(0,h.z8)({type:"error",message:"U have no Flag!"})}))},onBack(){this.$router.push("/")}}},y=a(2803);const f=(0,y.Z)(g,[["render",d],["__scopeId","data-v-1ba36793"]]);var v=f;const w={style:{padding:"14px"}},b={class:"bottom"};function k(e,t,a,n,l,u){const o=(0,r.up)("el-button"),c=(0,r.up)("el-card"),i=(0,r.up)("el-col"),d=(0,r.up)("el-row");return(0,r.wg)(),(0,r.j4)(d,null,{default:(0,r.w5)((()=>[((0,r.wg)(!0),(0,r.iD)(r.HY,null,(0,r.Ko)(l.productList,((e,t)=>((0,r.wg)(),(0,r.j4)(i,{key:e.ID,span:8,offset:t>=0?2:0},{default:(0,r.w5)((()=>[(0,r.Wm)(c,{"body-style":{padding:"0px"}},{default:(0,r.w5)((()=>[(0,r._)("div",w,[(0,r._)("span",null,(0,s.zw)(e.Name),1),(0,r._)("div",b,[(0,r._)("span",null,(0,s.zw)(e.Price),1),(0,r.Wm)(o,{onClick:t=>u.purchase(e.Name),plain:""},{default:(0,r.w5)((()=>[(0,r.Uk)("Purchase")])),_:2},1032,["onClick"])])])])),_:2},1024)])),_:2},1032,["offset"])))),128))])),_:1})}var _=a(3879),I={data(){return{productList:[]}},methods:{getProductList(){p.Z.get("/api/v1/product/list").then((e=>{this.productList=e.data.productList})).catch((()=>{(0,h.z8)({type:"error",message:"Failed to get product list"})}))},purchase(e){_.T.prompt("Please enter the purchase quantity","Purchase",{confirmButtonText:"OK",cancelButtonText:"Cancel",inputPattern:/^\d+$/,inputErrorMessage:"Invalid Number"}).then((({value:t})=>{p.Z.get("/api/v1/user/buyProduct",{params:{product:e,number:t}}).then((()=>{(0,h.z8)({type:"success",message:`Purchase ${e} * ${t} successfully`})})).catch((()=>{(0,h.z8)({type:"error",message:"Purchase failed"})}))})).catch((()=>{(0,h.z8)({type:"info",message:"Input canceled"})}))}},mounted(){this.getProductList()}};const z=(0,y.Z)(I,[["render",k]]);var S=z;function W(e,t,a,n,s,l){const u=(0,r.up)("el-table-column"),o=(0,r.up)("el-button"),c=(0,r.up)("el-table");return(0,r.wg)(),(0,r.iD)("div",null,[(0,r.Wm)(c,{data:s.orderSum,border:""},{default:(0,r.w5)((()=>[(0,r.Wm)(u,{prop:"name",label:"Product"}),(0,r.Wm)(u,{prop:"quantity",label:"Number"}),(0,r.Wm)(u,{label:"Operations",width:"120"},{default:(0,r.w5)((e=>[(0,r.Wm)(o,{size:"small",link:"",type:"danger",onClick:t=>l.sellProduct(e.row)},{default:(0,r.w5)((()=>[(0,r.Uk)("Sell")])),_:2},1032,["onClick"])])),_:1})])),_:1},8,["data"])])}var P={data(){return{orderSum:[]}},mounted(){this.getOrderSum(),this.intervalId=setInterval(this.getOrderSum,1e3)},beforeUnmount(){clearInterval(this.intervalId)},methods:{getOrderSum(){p.Z.get("/api/v1/user/getOrderSum").then((e=>{this.orderSum=Object.entries(e.data["orderSum"]).map((([e,t])=>({name:e,quantity:t})))})).catch((()=>{(0,h.z8)({type:"error",message:"Get orderSum failed"})}))},sellProduct(e){_.T.prompt("Please enter the sell quantity","Sell",{confirmButtonText:"OK",cancelButtonText:"Cancel",inputPattern:/^\d+$/,inputErrorMessage:"Invalid Number"}).then((({value:t})=>{p.Z.get("/api/v1/user/sellProduct",{params:{product:e.name,number:t}}).then((()=>{(0,h.z8)({type:"success",message:`Sell ${e.name} * ${t} successfully`})})).catch((()=>{(0,h.z8)({type:"error",message:"Sell failed"})}))})).catch((()=>{(0,h.z8)({type:"info",message:"Input canceled"})}))}}};const U=(0,y.Z)(P,[["render",W]]);var C=U,Z={name:"ShopView",components:{Header:v,ProductList:S,InventorySum:C}};const x=(0,y.Z)(Z,[["render",n]]);var F=x}}]);
//# sourceMappingURL=380.977ccee9.js.map