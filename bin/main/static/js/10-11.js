let basket = {
    sumPrice: 0, 
    totalPrice: 0,
    //체크한 장바구니 상품 비우기

    //재계산
    reCalc: function(){
        this.sumPrice = 0;
        this.totalPrice = 0;
        document.querySelectorAll(".count_num").forEach(function (item) {
            var check = item.parentElement.parentElement.parentElement.firstElementChild.firstElementChild;
            if(check.checked == true){
                var count = parseInt(item.getAttribute('value'));
                var shipping_fee = document.getElementById('shipping_fee');
                var i_shipping_fee = parseInt(shipping_fee.getAttribute('value'));
                var product_price = document.getElementById('product_price');
                var i_product_price = parseInt(product_price.getAttribute('value'));
                this.totalPrice += count * i_product_price;
                this.sumPrice = this.totalPrice + i_shipping_fee;
            }
        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
    },
    //화면 업데이트
    updateUI: function () {
       var sum_p_total= document.getElementById('sum_p_total');
        var sum_p_price=document.getElementById('sum_p_price');
        sum_p_total.setAttribute('value', this.sumPrice);
        sum_p_price.setAttribute('value', this.totalPrice);
    },
    //개별 수량 변경
    changePNum: function (pos) {
        var item = document.querySelector('input[id=p_num'+pos+']');
        var p_num = parseInt(item.getAttribute('value'));
        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
        
        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

        item.setAttribute('value', newval);
        item.value = newval;

        var price =item.parentElement.parentElement.nextElementSibling.firstElementChild;
        var product_price = document.getElementById('product_price');
        var price_num = parseInt(product_price.getAttribute('value'));
        var t_price = newval * price_num;

        price.setAttribute('value', t_price);
        //AJAX 업데이트 전송

        //전송 처리 결과가 성공이면    
        this.reCalc();
        this.updateUI();
    },
    checkItem: function () {
        this.reCalc();
        this.updateUI();
    },
    delItem: function () {
        event.target.parentElement.parentElement.parentElement.remove();
        this.reCalc();
        this.updateUI();
    }
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function(){
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};