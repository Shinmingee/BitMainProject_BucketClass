function searchHandler(){
    const serviceTitle = document.getElementById('input-title').value;
    const categorySel = document.getElementById('sel');
    const categoryVal = categorySel.options[categorySel.selectedIndex].value;

    console.log(serviceTitle, categoryVal);

    var searchConditionObject = new Object();
    searchConditionObject.service_title = serviceTitle;
    searchConditionObject.category_subject = categoryVal;
    
    location.href='/service-listing?serviceTitle='+serviceTitle+'&categorySubject='+categoryVal;
    
/*    console.log(typeof searchConditionObject, searchConditionObject);
    Apis.getRequest(searchConditionObject);*/
    
}