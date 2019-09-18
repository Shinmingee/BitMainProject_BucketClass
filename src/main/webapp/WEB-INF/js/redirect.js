function viewCustomerMyPage() {
    Apis.getRequest(`/customer/mypage`);
};

function viewBookmark() {
    location.href = "../views/bookmark.jsp";
};

function viewProviderMyPage() {
    location.href = "../views/provider-mypage.jsp";
};

function viewMyListing() {
    location.href = "../views/my-listing.jsp";
};

function viewMemberLogin() {
    location.href = "../views/member-login.jsp";
};

function viewMemberRegister() {
    location.href = "../views/member-register.jsp";
};

function viewAddListing() {
    location.href = "../views/dashboard-add-listing.jsp";
};

function viewServiceListing() {
    Apis.getRequest(`/service-listing`);
};
