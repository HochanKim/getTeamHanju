<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/css/testCss.css" />
    <script src="/js/jquery.js"></script>
    <script src="/js/axios.min.js"></script>
    <script src="/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <div>
        <label
          >이 이미지를 사용할 테이블 PK 번호 DB에는 FK_ID 로 들어감.<input
            type="text"
            v-model="pkNo"
            @input="fnSpaceRemover('pkNo')"
        /></label>
      </div>
      <div>
        <label
          >이 이미지의 용도. DB에는 FILE_STATUS 로 들어감.
          <select v-model="status">
            <option value="">필수 선택</option>
            <option value="T">썸네일 : DB에는 T 로 들어감</option>
            <option value="P">제품 이미지 : DB에는 P 로 들어감</option>
            <option value="D">상세 정보 이미지 : DB에는 D 로 들어감</option>
          </select>
        </label>
      </div>
      <div>
        이미지 추가. 하나만 됨.
        <input type="file" @change="fnFileChange" />
      </div>
      <div>
        <button @click="fnSave">이미지 업로드!</button>
      </div>
    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        pkNo: "",
        status: "",
        file: null,
      };
    },
    methods: {
      fnFileChange(event) {
        this.file = event.target.files[0];
      },
      fnSpaceRemover(item) {
        this[item] = this[item].replace(/[^0-9]/g, "");
      },
      async fnSave() {
        if (!this.pkNo) {
          alert("FK_ID 입력!");
          return;
        }
        if (!this.status) {
          alert("FILE_STATUS 선택 할 것!");
          return;
        }
        if (this.file == null) {
          alert("이미지 파일 선택 필수.");
          return;
        }
        const url = "imgSave.dox";
        const formData = new FormData();
        formData.append("file", this.file);
        formData.append("pkNo", this.pkNo);
        formData.append("status", this.status);
        try {
          const res = await axios.post(url, formData);
          console.log(res.data);
          alert("저장 완료.");
          this.pkNo = "";
          this.status = "";
          this.file = null;
        } catch (error) {
          alert("그냥 뭔가 잘못됨. 서버 확인 해볼것...");
        }
      },
    },
    mounted() {},
  });
  app.mount("#app");
</script>
