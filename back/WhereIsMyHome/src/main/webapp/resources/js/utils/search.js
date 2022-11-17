let sidoText = "전체";
let gugunText = "";
let regcode = "11110000";
let inputText = "";

sendRequest("sido", "%00000000");

// https://juso.dev/docs/reg-code-api/
// let url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
// let regcode = "*00000000";
// 전국 특별/광역시, 도
// https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000

// 텍스트 검색 반영
document.querySelector("#inputText")?.addEventListener("change", function () {
  inputText = this.value;
});

//// 도/광역시 설정 반영
//document.querySelector("#sido")?.addEventListener("change", function () {
//  gugunText = "";
//  if (!this[this.selectedIndex].value) sidoText = "전체";
//  else sidoText = this[this.selectedIndex].innerHTML;
//
//  if (this[this.selectedIndex].value) {
//    let _regcode = this[this.selectedIndex].value.substr(0, 2) + "*00000";
//    console.log(_regcode)
//    sendRequest("gugun", _regcode);
//  } else {
//    initOption("gugun");
//    initOption("dong");
//  }
//});
//
//
//// 시/구/군 설정 반영
//document.querySelector("#gugun")?.addEventListener("change", function () {
//  if (!this[this.selectedIndex].value) gugunText = "";
//  else gugunText = this[this.selectedIndex].innerHTML;
//   sendRequest("dong", regcode);
//   console.log(regcode)
//  if (this[this.selectedIndex].value) {
//    regcode = this[this.selectedIndex].value.substr(0, 5) + "*";
//  } else {
//	initOption("dong");
//  }
//});

//도/광역시 설정 반영
//document.querySelector("#sido").addEventListener("change", function () {
//  if (this[this.selectedIndex].value) {
//    let regcode = this[this.selectedIndex].value.substr(0, 2) + "*00000";
//    sendRequest("gugun", regcode);
//    initOption("dong");
//    console.log(_regcode)
//
//  } else {
//    initOption("gugun");
//    initOption("dong");
//  }
//});
//
////시/구/군 설정 반영
document.querySelector("#gugun").addEventListener("change", function () {
	
 if (this[this.selectedIndex].value) {
   let regcode = this[this.selectedIndex].value.substr(0, 5) + "*";
   sendRequest("dong", regcode);
   console.log(regcode)

 } else {
   initOption("dong");
 }
});

function sendRequest(selid, regcode) {
//  const url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
//   let params = "regcode_pattern=" + regcode + "&is_ignore_zero=true";
  
//  const url = "http://localhost:8080/deal?act=select"
//  let params =  selid + "=" + regcode;
//  
// fetch(`${url}&${params}`)
//   .then((response) => response.text())
//   .then((data) => addOption(selid, data));
}


function addOption(selid, data) {
 let opt = ``;
 initOption(selid);
  console.log(selid);
  console.log(data);
 switch (selid) {
   case "sido":
     opt += `<option value="">도/광역시</option>`;
     data.regcodes.forEach(function (regcode) {
       opt += `
           <option value="${regcode.code}">${regcode.name}</option>
           `;
     });
     break;
   case "gugun":
     opt += `<option value="">시/구/군</option>`;
     for (let i = 0; i < data.regcodes.length; i++) {
       if (i != data.regcodes.length - 1) {
         if (
           data.regcodes[i].name.split(" ")[1] == data.regcodes[i + 1].name.split(" ")[1] &&
           data.regcodes[i].name.split(" ").length != data.regcodes[i + 1].name.split(" ").length
         ) {
           data.regcodes.splice(i, 1);
           i--;
         }
       }
     }
     let name = "";
     data.regcodes.forEach(function (regcode) {
       if (regcode.name.split(" ").length == 2) name = regcode.name.split(" ")[1];
       else name = regcode.name.split(" ")[1] + " " + regcode.name.split(" ")[2];
       opt += `
       <option value="${regcode.code}">${name}</option>
       `;
     });
     regcode = data.regcodes[0].code;
     break;
   case "dong":
       opt += `<option value="">읍/면/동</option>`;
       let idx = 2;
       data.regcodes.forEach(function (regcode) {
         if (regcode.name.split(" ").length != 3) idx = 3;
         opt += `
         <option value="${regcode.code}">${regcode.name.split(" ")[idx]}</option>
         `;
     });
 }
 document.querySelector(`#${selid}`).innerHTML = opt;
}

function initOption(selid) {
	console.log("init" + selid);
 let options = document.querySelector(`#${selid}`);
 options.length = 0;
 switch (selid) {
   case "sido":
     options.innerHTML = `<option value="">도/광역시</option>`;
     break;
   case "gugun":
     options.innerHTML = `<option value="">시/구/군</option>`;
     break;
   case "dong":
     options.innerHTML = `<option value="">읍/면/동</option>`;
     break;
 }
}
