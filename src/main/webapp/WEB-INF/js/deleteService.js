$(".expiredServiceDelete").click(function(){
    var result = confirm("완료하신 서비스 내역을 정말 삭제하시겠습니까?");
    if(result){
        location.href = 'dashboard-my-listings-expired.html';

        // 서비스 번호 파라미터 넘겨주기 추후 구현
    }
});

$(".pendingServiceDelete").click(function(){
    var result = confirm( "대기중인 서비스 내역을 정말 삭제하시겠습니까?");
    if(result){
        location.href = 'dashboard-my-listings-pending.html';

        // 서비스 번호 파라미터 넘겨주기 추후 구현
    }
});