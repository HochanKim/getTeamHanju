<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userCss.css" />
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <title>document</title>
  </head>
  <body>
    <div id="app">
      <h2>회원가입</h2>

      <table>
        <tr>
          <th>회원구분</th>
          <td>
            <label><input type="radio" name="status" v-model="status" value="M">일반회원</label>
            <label><input type="radio" name="status" v-model="status" value="S">사업자회원</label>
          </td>
        </tr>
      </table>

      <h3>기본정보</h3>
      <div>*필수입력사항</div>
      <table>
        <tr>
          <th>아이디*</th>
          <td>
            <input type="text" id="userId" v-model="userId" @input="fnIdCheck"><span>(영문소문자/숫자,4~16자)</span>
            <div v-if="idUse">사용 가능한 아이디입니다.</div>
            <div v-if!="idUse">이미 사용중인 아이디입니다.</div>
          </td>
        </tr>
        <tr>
          <th>비밀번호*</th>
          <td>
            <input type="text" id="password" v-model="password"  @input="fnPwdCheck"><span>(영문대소문자/숫자/특수문자 중 2가지 이상 조합,10자~16자)</span>
            <div v-if="fnPwdCheck"></div>
          </td>
        </tr>
        <tr>
          <th>비밀번호 확인*</th>
          <td><input type="text" id="passwordCheck" v-model="passwordCheck" @input="fnPwdCheck2"></td>
        </tr>
        <tr>
          <th>이름*</th>
          <td><input type="text" id="userName" v-model="userName"></td>
        </tr>
        <tr>
          <th>주소*</th>
          <td>
            <div><input type="text" id="post" v-model="post" placeholder="우편번호"><button>주소검색</button></div>
            <div><input type="text" id="addr1" v-model="addr1" placeholder="기본주소"></div>
            <div><input type="text" id="addr2" v-model="addr2" placeholder="나머지 주소(선택 입력 가능)"></div>
          </td>
        </tr>
        <tr>
          <th>일반전화</th>
          <td>
            <select id="tel1" v-model="tel1">
              <option value="02">02</option>
              <option value="031">031</option>
              <option value="032">032</option>
              <option value="033">033</option>
              <option value="041">041</option>
              <option value="042">042</option>
              <option value="043">043</option>
              <option value="044">044</option>
              <option value="051">051</option>
              <option value="052">052</option>
              <option value="053">053</option>
              <option value="054">054</option>
              <option value="055">055</option>
              <option value="061">061</option>
              <option value="062">062</option>
              <option value="063">063</option>
              <option value="064">064</option>
            </select>-<input type="text" id="tel2" v-model="tel2" maxlength="4">-<input type="text" id="tel3" v-model="tel3" maxlength="4">
          </td>
        </tr>
        <tr>
          <th>휴대전화*</th>
          <td>
            <select id="phone1" v-model="phone1">
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
              <option value="018">018</option>
              <option value="019">019</option>
            </select>-<input type="text" id="phone2" v-model="phone2" maxlength="4">-<input type="text" id="phone3" v-model="phone3" maxlength="4">
          </td>
        </tr>
        <tr>
          <th>이메일*</th>
          <td><input type="text" id="email" v-model="email"></td>
        </tr>
      </table>

      <h3>추가정보</h3>
      <table>
        <tr>
          <th>생년월일</th>
          <td>
            <input type="text" id="year" v-model="id" maxlength="4">년<input type="text" id="month" v-model="month" maxlength="2">월<input type="text" id="day" v-model="day" maxlength="2">일
          </td>
        </tr>
      </table>

      <h3>전체 동의</h3>
      <div>
        <input type="checkbox" id="allAgree" v-model="allAgree">
        <strong>모든 약관을 확인하고 전체 동의합니다.</strong>
      </div>
      <div>
        <h3>[필수] 이용약관 동의</h3>
        <div class="content">
          <p>이용약관</p>
          <p>본 약관은 ooo(전자상거래 사업자)(이하 “회사”)가 운영하는 인터넷사이트 한주(이하 “한주”)에서 제공하는 전자상거래 관련 모든 서비스(이하 “서비스”)를 이용함에 있어 한주와 이용자의 권리, 의무, 책임사항 및 기타 필요한 사항을 규정함을 목적으로 한다.</p>
          <br>

          <p>제1조(목적)</p>
          <p>본 약관은 한주에서 제공하는 전자상거래 관련 서비스 이용에 대한 권리, 의무, 책임사항을 규정한다.</p>
          <br>

          <p>제2조(정의)</p>
          <p>본 약관에서 사용하는 용어의 정의는 다음과 같다.</p>
          <br>
          <p>한주: 회사가 재화 또는 용역을 이용자에게 제공하기 위해 설정한 가상의 영업장 및 서비스를 운영하는 사업자.</p>
          <p>이용자: 본 약관에 따라 한주가 제공하는 서비스를 받는 회원 및 비회원.</p>
          <p>회원: 한주에 개인정보를 제공하여 회원 등록을 한 자로, 서비스를 이용할 수 있는 자.</p>
          <p>비회원: 회원에 가입하지 않고 한주가 제공하는 서비스를 이용하는 자.</p>
          <p>가입: 한주가 제공하는 신청서 양식에 정보를 기입하고 본 약관에 동의하여 서비스 이용계약을 완료하는 행위.</p>
          <p>콘텐츠: 회사 또는 이용자가 서비스 상에 게시 또는 등록하는 모든 글, 사진, 동영상 등.</p>
          <br>

          <p>제3조(약관 등의 명시와 설명 및 개정)</p>
          <p>한주는 본 약관의 내용을 초기 서비스화면에 게시하며, 개정 시에는 적용일자 및 개정사유를 공지한다.</p>
          <br>
          <p>약관 개정 시, 이용자는 개정된 약관에 동의하지 않을 경우 회원등록을 취소할 수 있다.</p>
          <p>본 약관에서 정하지 않은 사항은 관련 법령의 규정에 따른다.</p>
          <br>

          <p>제4조(서비스의 제공 및 변경)</p>
          <p>한주는 다음과 같은 업무를 수행하며, 재화 또는 용역의 품절 및 기술적 사양 변경 시 공지한다.</p>
          <br>
          <p>재화 또는 용역에 대한 정보제공 및 구매계약 체결</p>
          <p>구매계약 체결된 재화 또는 용역의 배송</p>
          <p>;기타 한주가 정하는 업무</p>
          <br>

          <p>제5조(서비스의 중지)</p>
          <p>서비스의 제공이 중단될 경우, 한주는 손해에 대해 배상하되, 고의 또는 과실이 없음을 입증하는 경우는 제외된다.</p>
          <br>
          <p>컴퓨터 등 정보통신설비의 보수점검, 고장, 통신의 차단 등의 사유 발생 시 서비스 중단</p>
          <p>서비스 제공을 중단하게 되는 경우, 이용자에게 통지하고 보상 조건 제시</p>
          <p>회원의 본 약관 위반 시, 서비스 사용을 제한 및 중지할 수 있다.</p>
          <br>

          <p>제6조(회원가입)</p>
          <p>이용자는 한주가 정한 양식에 따라 회원가입을 신청하며, 한주는 다음과 같은 이용자를 회원으로 등록하지 않는다.</p>
          <br>
          <p>본 약관에 따라 회원 자격을 상실한 경우</p>
          <p>허위사실, 기재 누락, 오기가 있는 경우</p>
          <p>회원으로 등록하는 것이 기술상 현저히 지장이 있는 경우</p>
          <p>타인의 명의를 이용하여 회원가입을 신청한 경우</p>
          <p>타인의 서비스 이용을 방해하거나 정보를 도용한 경우</p>
          <p>만 19세 미만의 경우</p>
      </div>
      <div>
        <label>이용약관에 동의하십니까?<input type="checkbox" v-model="agree1">동의함</label>
      </div>
      </div>
      <div>
        <h3>[필수] 개인정보 수집 및 이용 동의</h3>
        <div class="content">
          <p>1. 개인정보 수집목적 및 이용목적</p>
          <p>
              가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>
              콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스
          </p>
          <p>
              나. 회원 관리<br>
              회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인, 만 19세 미만 가입 불가, 불만처리 등 민원처리, 고지사항 전달
          </p>
          <p>2. 수집하는 개인정보 항목</p>
          <p>
              이름, 로그인ID, 비밀번호, 이메일
          </p>
          <p>3. 개인정보의 보유기간 및 이용기간</p>
          <p>
              원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
          </p>
          <p>
              가. 회사 내부 방침에 의한 정보 보유 사유<br>
              부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 5년
          </p>
          <p>
              나. 관련 법령에 의한 정보보유 사유<br>
              계약 또는 청약철회 등에 관한 기록<br>
              - 보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
              - 보존기간 : 5년
          </p>
          <p>
              대금 결제 및 재화 등의 공급에 관한 기록<br>
              - 보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
              - 보존기간 : 5년
          </p>
          <p>
              소비자 불만 또는 분쟁처리에 관한 기록<br>
              - 보존이유 : 전자상거래등에서의소비자보호에관한법률<br>
              - 보존기간 : 3년
          </p>
          <p>
              로그 기록<br>
              - 보존이유 : 통신비밀보호법<br>
              - 보존기간 : 3개월
          </p>
          <p>※ 동의를 거부할 수 있으나 거부 시 회원 가입이 불가능합니다.</p>
        </div>
        <div>
          <label>개인정보 수집 및 이용에 동의하십니까?<input type="checkbox" v-model="agree2">동의함</label>
        </div>
      </div>
      <div>
        <h3>[선택] 쇼핑정보 수신 동의</h3>
        <div class="content">
          <p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.</p>
          <p>단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
          <p>선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
        </div>
        <div>
          <label>SMS 수신을 동의하십니까?<input type="checkbox" v-model="notAgree1">동의함</label>
          <label>이메일 수신을 동의하십니까?<input type="checkbox" v-model="notAgree2">동의함</label>
        </div>
      </div>

      <button class="joinBtn">회원가입</button>

    </div>
  </body>
</html>
<script>
  const app = Vue.createApp({
    data() {
      return {
        userId:"",
        idUse:false,
      };
    },

    methods: {
      fnJoin() {
        $.ajax({
          url: "user/join.dox",
          dataType: "json",
          type: "POST",
          data: {},
          success: (data) => {
            console.log(data.result);
            this.test = data.result;
          },
        });
      },

      fnIdCheck(){
        $.ajax({
          url: "test.dox",
          dataType: "json",
          type: "POST",
          data: {},
          success: (data) => {
            console.log(data.result);
            this.test = data.result;
          },
        });
          },

    },

    mounted() {

    },
  



});
  app.mount("#app");
</script>