<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>

		<script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" 
        crossorigin="anonymous"></script>
		<!-- 소스 다운 -->
        <script src="https://unpkg.com/@yaireo/tagify"></script>
        <!-- 폴리필 (구버젼 브라우저 지원) -->
   		<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" 
    	rel="stylesheet" type="text/css" />
    	
    <style>
        body {
            margin: 0;
            padding: 0;
            font-size: 12px;
        }
        .all-box {
            width: 1500px;
            height: 2100px;
            display: flex;
            margin: 0 auto;
        }

        /* 왼쪽 사이드 */
        .sidebar_left{
            width: 360px;    
            background: pink;
        }

        .centerbar{
            width: 880px;
            background: rgb(255, 255, 255);
        }
        .center_top{
            width: 880px;
            height: 450px;
            background: rgb(255, 255, 255);
            display: flex;
            justify-content: space-around;
        }
        .top_left_box,
        .top_center_box,
        .top_right_box{
            width: 250px;
            height: 120px;
            /* background: rgb(200, 255, 168) ; */
            margin-top: 200px;
            padding: 0 35px ;
            box-sizing: border-box;
            text-align: center;
            
            /* box-shadow: 10px 10px 3px rgb(131, 131, 131, .3); */ 
        }
        .top_left_box{
           
        }
        .top_center_box{
          
        }
        .top_right_box{
            
        }
        .main_box,
        .all_recipe,
        .my_page{
            width: 180px;
            height: 100px;
            background: #ECF2FE;
            box-shadow: 8px 8px 3px rgb(131, 131, 131, .3);
            
        }
        .center_top span{
            text-align: center;
            display: block;

          
            /* margin-left: -8px; */
            margin-top: 10px;
            /* background: red; */
            
        }

        .main_box{
            
        }

        .all_recipe{
           
        }

        .my_page{
           
        }


        /* 센터  */
        .center_center{
            width: 880px;
            height: 1200px; 
            background: rgb(255, 255, 255);
            /* border: 1px solid red; */
        }
        .my_recipes{
            width: 880px;
            height: 100px; 
            background: #DEEBFC;
             
        }
        .my_recipes_revicebox{
            width: 300px; 
            height: 100px; 
            /* background-color: blue; */
            margin-left: 1rem;
            text-align: center;
            padding: 2rem;
            box-sizing: border-box;
        }
        .my_recipes span{
           
  
            /* background: rgb(215, 215, 255); */
            font-size: 24px;
        }

        .food_photo_box_main{
            width: 880px;
            height: 1150px; 
            background: #DEEBFC;
            margin-top: 50px;
            
            display: flex;
            flex-wrap: wrap;
            padding: 10px;
            box-sizing: border-box;
            overflow: hidden;
            position: relative;
        }
        .food_photo_box{
            width: 800px;
            height: 900px; 
            /* background: rgb(76, 150, 100); */
            display: flex;
            
            flex-wrap: wrap;
            /* padding: 20px; */
            box-sizing: border-box;
            align-items: center;
            margin-left: 30px;
            margin-top: 120px;
            position: absolute;
           
            transition: transform 0.5s ease-in-out;
            /* border: 1px solid blueviolet; */
           
        }
        
        
        .food_photo {
            width: calc(25% - 20px);
            height: calc(20% - 20px);
            margin: 10px;
            padding: 10px;
            box-sizing: border-box;
            background: rgb(207, 207, 207);
            /* border: 1px solid black; */
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 1s;
            border-radius: 1rem;
            background: #fff;
           
            
        }
        .food_photo img {
            max-width: 100%;
            max-height: 100%;
            border-radius: 1rem;
            z-index: 1000;
            object-fit: cover;
        }
        .slide{
            width: 100%;
            height: 100%;
            transition: 1s;
             /* position: absolute;  */
        }
        
        
    .pagination {
        margin: 150px;

        margin-left: 330px;
        display: flex;
        align-items: center;
        
    }

    .prev, .next {
        width: 20px;
        height: 20px;
        background: none;
        border: none;
        cursor: pointer;
        
        
    }

    .page-num-container {
        width: 150px;
        height: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 15px;
        border-radius: 5px;
        background-color: white;
    
    }

    .page-num {
        border: 1px solid #bbb;
        border-radius: 3px;
        color: rgb(199, 199, 199);
        width: 100%;
        text-align: center;
        transition: background-color 0.5s ease;
        opacity: 1; /* 페이지 번호가 항상 표시되도록 설정 */
        font-family: 'Comic Sans MS', cursive;
   
    }

    .left-background {
    background-color: #37517e;
    /* color: white; */
    }

      
 
        .center_bottom{
            width: 880px;
            height: 450px; 
            background: rgb(255, 255, 255);
            /* border: 1px solid red; */
        }
       
        


        /* 오른쪽 사이드 */
        .sidebar_right{
            width: 360px;
            background: pink;
          
        }
        .side_right_radius_box{
            text-align: center;
            width: 30px;
            height: 30px;
            border-radius: 5px;
            background: rgb(126, 126, 126, 0.1);

            margin: auto;
            margin-top: 1650px;
            display: flex;
            align-items: center; /* 수직 정렬 */

        }
        .high {
        width: 20px;
        height: 20px;
        margin: auto;
        
        filter: brightness(0) saturate(100%) grayscale(100%) contrast(100%);
       
        background: url('https://png.pngtree.com/png-vector/20220628/ourmid/pngtree-upload-arrow-direction-upward-icon-png-image_5289679.png') no-repeat;
        background-size: contain; /* 이미지를 요소의 크기에 맞게 조정 */
        border: none;
        cursor: pointer;
        
        }
    </style>
</head>
<body>
    <div class="all-box">  
            <div class="centerbar">

                <div class="center_top">
                    <div class="top_left_box">
                        <div class="main_box"></div>
                        <span>메인화면</span>
                    </div>
                    <div class="top_center_box">
                        <div class="all_recipe"></div>
                        <span>전체레시피</span>
                    </div>
                    <div class="top_right_box">
                        <div class="my_page"></div>
                        <span>마이페이지</span>
                    </div>
                </div>

                <div class="center_center">
                    <div class="my_recipes">
                        <div class="my_recipes_revicebox"><span>나의 레시피 수정</span></div>
                    </div>

                    <div class="food_photo_box_main">
                        <!-- 1 -->
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/236/1000/500" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 2 -->
                        <div class="food_photo_box" onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/237/1000/500" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 3 -->
                        <div class="food_photo_box" onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/238/1000/500" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 4 -->
                        <div class="food_photo_box" onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/239/1000/500" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 5 -->
                        <div class="food_photo_box" onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/240/1000/500" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 6 -->
                        <div class="food_photo_box" onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://picsum.photos/id/241/1000/500" class="slide" alt="">
                            </div>
                        </div>
                        
                    </div>
                    
                    <div class="pagination">
                        <button class="prev"><</button>
                        <div class="page-num-container">
                            <div class="page-num">1 of 6</div>
                        </div>
                        <button class="next">></button>
                    </div>
                    <script src="script.js"></script>

                </div>

            </div>
    </div>
    
    <script>
    
    // 1 슬라이드 
// const slides = document.querySelectorAll(".food_photo_box");
// let counter = 0;

// slides.forEach((food_photo_box, index) => {
//     food_photo_box.style.left = `${index * 100}%`;
// });

// const prev = () => {
//     counter--;
//     if (counter < 0) {
//         counter = slides.length - 1;
//     }
//     slideImage();
// };

// const next = () => {
//     counter++;
//     if (counter === slides.length) {
//         counter = 0;
//     }
//     slideImage();
// };

// const slideImage = () => {
//     slides.forEach((food_photo_box) => {
//         food_photo_box.style.transform = `translateX(-${counter * 100}%)`;
//     });
// };


// 이전 버튼과 다음 버튼에 이벤트 리스너 추가
document.querySelector(".prev").addEventListener("click", prev);
document.querySelector(".next").addEventListener("click", next);


// //  2 슬라이드 
// // 슬라이드 요소들을 가져옵니다.
// const slides = document.querySelectorAll(".food_photo_box");
// // 현재 슬라이드 위치를 나타내는 변수를 설정합니다.
// let counter = 0;

// // 각 슬라이드 요소의 초기 위치를 설정합니다.
// slides.forEach((food_photo_box, index) => {
//     food_photo_box.style.left = `${index * 100}%`;
// });

// // 이전 버튼을 클릭했을 때의 동작을 정의합니다.
// const prev = () => {
//     counter--;
//     // 슬라이드 이미지를 이동시키는 함수를 호출합니다.
//     slideImage();
// };

// // 다음 버튼을 클릭했을 때의 동작을 정의합니다.
// const next = () => {
//     counter++;
//     // 슬라이드 이미지를 이동시키는 함수를 호출합니다.
//     slideImage();
// };

// // 슬라이드 이미지를 이동시키는 함수를 정의합니다.
// const slideImage = () => {
//     // 각 슬라이드 요소의 위치를 조정하여 슬라이드를 이동시킵니다.
//     slides.forEach((food_photo_box, index) => {
//         food_photo_box.style.left = `${index * 100 - counter * 100}%`;
//     });
// };

 //3 슬라이드 
const slides = document.querySelectorAll(".food_photo_box");
let counter = 0;

// 슬라이드 요소들의 위치 초기화
slides.forEach((food_photo_box, index) => {
    food_photo_box.style.transform = `translateX(-${index * 100}%)`;
});

// 페이지 번호 요소 선택
const pageNumElement = document.querySelector('.page-num');

// 페이지 번호 설정
let currentPage = 1;
const totalPages = 6;

// 페이지 번호 업데이트 함수
function updatePageNum() {
    pageNumElement.textContent = `${currentPage} of ${totalPages}`;

    // 배경색 채우기
    const percentage = (currentPage / totalPages) * 100;
    pageNumElement.style.background = `linear-gradient(to right, #0074d9 ${percentage}%, #fff ${percentage}%)`;

    // 현재 페이지가 1일 때 배경색 변경
    if (currentPage === 1) {
        pageNumElement.classList.add('left-background');
    } else {
        pageNumElement.classList.remove('left-background');
    }
}

// 이전 페이지로 이동
function prev() {
    if (currentPage > 1) {
        currentPage--;
        updatePageNum();
        slideImage();
    }
}

// 다음 페이지로 이동
function next() {
    if (currentPage < totalPages) {
        currentPage++;
        updatePageNum();
        slideImage();
    }
}

// 슬라이드 이미지를 이동시키는 함수
function slideImage() {
    slides.forEach((food_photo_box, index) => {
        food_photo_box.style.transition = "transform 0.5s ease"; // 부드러운 전환을 위한 트랜지션 추가
        food_photo_box.style.transform = `translateX(${(index - (currentPage - 1)) * 120}%)`; // 이동된 위치로 변경
    });
}

// 초기 페이지 번호 설정
updatePageNum();

// 이전 버튼과 다음 버튼에 이벤트 리스너 추가
document.querySelector(".prev").addEventListener("click", prev);
document.querySelector(".next").addEventListener("click", next);

document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.button');
    const slides = document.querySelectorAll('.food_photo_box');

    

   
});

    </script>
    

</body>

</html>