<%@ page pageEncoding="utf-8"%>
<%@page import="model.dao.CartDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chân trang</title>
</head>
<style>
</style>
<body>
	
  <script src="viewroot/js/jquery-3.3.1.min.js"></script>
    <script src="viewroot/js/bootstrap.min.js"></script>
    <script src="viewroot/js/jquery.nice-select.min.js"></script>
    <script src="viewroot/js/jquery-ui.min.js"></script>
    <script src="viewroot/js/jquery.slicknav.js"></script>
    <script src="viewroot/js/mixitup.min.js"></script>
    <script src="viewroot/js/owl.carousel.min.js"></script>
    <script src="viewroot/js/main.js"></script>
   <script type="text/javascript">
   function addProductToCart(id) {
var url="HomeCartServlet?status=add&id_product="+id;
		$.ajax({
			url : url,
			type : "get",
			success : function(response) {
				console.log(response);
		           var count= $("#count").text();
		           var a = parseInt(count); 
			    var carts=a+1;
			    $("#count").html(""+carts+"");
				alert("Thêm vào giỏ hành thành công" +count);
			},
			error : function(xhr) {
				console.log("ERROR: ", e);
			}
		});
	};
</script>
    <script type="text/javascript">
        function loadDistrict(id) {
            $.ajax({
    			url :  "HomeCheckoutServlet?status=district&id_tinh_thanhpho=" + id + "",
    			type : "get",
    			success : function(response) {
    				$('#district').html(response);
    		        
    			},
    			error : function(xhr) {
    				console.log("ERROR: ", e);
    			}
    		});
         
        }
        function load_town_ward(id) {
        	 $.ajax({
     			url :  "HomeCheckoutServlet?status=town_ward&id_quan_huyen=" + id + "",
     			type : "get",
     			success : function(response) {
     				$('#town_ward').html(response);
     		        
     			},
     			error : function(xhr) {
     				console.log("ERROR: ", e);
     			}
     		});
        }
        

        //Xự kiện chỉ nhập số
        function keyPhone(e) {
            var keyword = null;
            if (window.event) {
                keyword = window.event.keyCode;
            } else {
                keyword = e.which;
            }

            if (keyword<48 || keyword>57) {
                if (keyword == 8 || keyword == 48 || keyword == 127) {
                    return true;
                }
                return false;
            }
        }
    </script>
<script>
		$(document).ready(function() {
			var readURL = function(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('.avatar').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			var fileValidation = function() {
				var fileInput = document.getElementById('file-up-avatar');
				var filePath = fileInput.value;//lấy giá trị input theo id
				var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;//các tập tin cho phép
				//Kiểm tra định dạng
				if (!allowedExtensions.exec(filePath)) {
					swal({
						type : 'error',
						title : 'Rất tiết...',
						text : 'Tệp tải lên có định dạng không được hổ trợ!',
					});

					fileInput.value = '';
					return false;
				}
			}
			$(".file-upload").on('change', function() {
				fileValidation();
				readURL(this);
			});
		});
	</script>
</body>
</html>