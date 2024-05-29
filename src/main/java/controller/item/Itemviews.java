package controller.item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dao.ItemDAO;
import dao.ReviewDAO;
import dto.Category;
import dto.Item;
import dto.Review;
import hat1.info.ProductE;
import hat1.info.ProductM;
import hat1.info.ProductS;


@WebServlet("/item/ItemView")
public class Itemviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Itemviews() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        try {
        	int it_uid = Integer.parseInt(request.getParameter("it_uid"));
            String pageNum = request.getParameter("pageNum");
            String field = request.getParameter("field");
            String search =  request.getParameter("search");
            ItemDAO dao = new ItemDAO();
            Item item = dao.oneItem(it_uid);
            
            //한 페이지 보여질 글의 갯수
            int pageSize = 10;
                            
            //현재 보여지는 페이지의 넘버 값 처리
            int pageNum1 = 1;
           

            //전체 게시글 갯수 초기화
            int count = 0;

            //페이지 내에서 보여질 넘버링 숫자 처리 초기화
            int number = 0;
            ReviewDAO dao1 = new ReviewDAO();		
                    
            //전체 게시글 수
            count = dao1.getAllcount(field, search, it_uid);

            //현재 보여질 페이지 limit 값 설정
            int startRow = (pageNum1 - 1) * pageSize;
            int endRow = pageSize;
            ArrayList<Review> v1 = dao1.getAllRev(startRow, endRow, field, search, it_uid);

            //넘버링 숫자
            number = count - (pageNum1 - 1) * pageSize;
            ArrayList<Category> v = dao.getTotal();
            

            // 무신사 상품 정보 가져오기
            List<ProductM> musinsaProducts = crawlMusinsa(it_uid);

            // 이마트 상품 정보 가져오기
            List<ProductE> emartProducts = crawlEmart(it_uid);
            
            List<ProductS> ssgProducts = crawlSsg(it_uid);
            
            // JSP 페이지에 상품 정보 전달

            request.setAttribute("musinsaProducts", musinsaProducts);
            request.setAttribute("emartProducts", emartProducts);
            request.setAttribute("ssgProducts", ssgProducts);
            
            //카테고리 값
            request.setAttribute("v", v);
            request.setAttribute("v1", v1);
            request.setAttribute("number", number);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("count", count);
            request.setAttribute("pageNum", pageNum);
            request.setAttribute("field", field);
            request.setAttribute("it_uid", it_uid);
            request.setAttribute("search", search);
            request.setAttribute("item", item /* i */);
            
            System.out.println("v1"+v1);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/item/view.jsp");
            dispatcher.forward(request, response);

        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred during crawling: " + e.getMessage());
        }
    }
    private List<ProductM> crawlMusinsa(int it_uid) throws IOException {
        String musinsaUrl; 
        if(it_uid ==10) {
        	musinsaUrl = "https://www.musinsa.com/search/musinsa/integration?q=%EC%96%B8%EC%8A%A4%ED%8A%B8%EB%9F%AD%EC%B3%90+%EB%B3%BC%EC%BA%A1+LA";
        }else if(it_uid ==11) {
        	musinsaUrl = "https://www.musinsa.com/search/musinsa/integration?q=%EA%B2%8C%EC%8A%A4";
        }else if(it_uid==12){
        	musinsaUrl="https://www.musinsa.com/search/musinsa/integration?q=%EC%BD%94%EB%8B%A5+%EB%AA%A8%EC%9E%90";
	    }else if(it_uid==13){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/integration?q=%EC%95%84%EB%AF%B8+%EB%B9%84%EB%8B%88";
	    }else if(it_uid==14){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/integration?q=%ED%8F%B4%EB%A1%9C%EB%B9%84%EB%8B%88";
	    }else if(it_uid==15){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/integration?q=%EB%82%98%EC%9D%B4%ED%82%A4+%ED%8B%B0";
	    }else if(it_uid==16){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/integration?q=%ED%8C%90%EB%8F%84%EB%9D%BC";
	    }else if(it_uid==17){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/goods?q=%ED%8C%90%EB%8F%84%EB%9D%BC+%EB%B0%98%EC%A7%80&list_kind=small&sortCode=pop&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
	    }else if(it_uid==18){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/goods?q=%ED%83%91%ED%85%90+%EC%8A%AC%EB%9E%99%EC%8A%A4&list_kind=small&sortCode=pop&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
	    }else if(it_uid==19){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/integration?q=%EC%97%90%EC%9E%87%EC%84%B8%EC%BB%A8%EC%A6%88+%EB%B2%A8%ED%8A%B8+25";
	    }else if(it_uid==20){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/goods?q=%ED%83%91%ED%85%90+%EC%B2%AD%EB%B0%94%EC%A7%80&list_kind=small&sortCode=pop&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
	    }else if(it_uid==21){
	    	musinsaUrl="https://www.musinsa.com/search/musinsa/goods?q=%EB%82%98%EC%9D%B4%ED%82%A4+%EC%96%91%EB%A7%90&list_kind=small&sortCode=pop&sub_sort=&page=1&display_cnt=0&saleGoods=&includeSoldOut=&setupGoods=&popular=&category1DepthCode=&category2DepthCodes=&category3DepthCodes=&selectedFilters=&category1DepthName=&category2DepthName=&brandIds=&price=&colorCodes=&contentType=&styleTypes=&includeKeywords=&excludeKeywords=&originalYn=N&tags=&campaignId=&serviceType=&eventType=&type=&season=&measure=&openFilterLayout=N&selectedOrderMeasure=&shoeSizeOption=&d_cat_cd=&attribute=&plusDeliveryYn=";
	    }else {
        	return null;
        }
        Document musinsaDoc = Jsoup.connect(musinsaUrl).get();
        Elements musinsaItems = musinsaDoc.select("li.li_box");
        List<ProductM> musinsaProducts = new ArrayList<>();

        for (Element item : musinsaItems) {
            ProductM productM = extractProductM(item, it_uid);
            if (productM != null) {
                musinsaProducts.add(productM);
            }
        }

        return musinsaProducts;
    }

    private List<ProductE> crawlEmart(int it_uid) throws IOException {
        String emartUrl;
        if (it_uid == 10) {
            // it_uid가 1일 때의 URL 설정
            emartUrl = "https://emart.ssg.com/item/itemView.ssg?itemId=1000527005906&siteNo=6001&salestrNo=6005&tlidSrchWd=%EC%97%A0%EC%97%98%EB%B9%84%20N-COVER%20%EC%96%B8%EC%8A%A4%ED%8A%B8%EB%9F%AD%EC%B3%90%20%EB%B3%BC%EC%BA%A1&srchPgNo=1";
        } else if (it_uid == 11) {
            // it_uid가 2일 때의 URL 설정
            emartUrl = "https://emart.ssg.com/item/itemView.ssg?itemId=1000574432942&siteNo=6001&salestrNo=6005&tlidSrchWd=%EA%B2%8C%EC%8A%A4%20%EC%82%BC%EA%B0%81%20%EB%B0%98%ED%8C%94%ED%8B%B0%20%EB%82%A8%EC%84%B1&srchPgNo=1";
        }else if(it_uid==12){	//스퀘어로고 릴렉스핏 볼캡 BLUE
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000596430376&siteNo=6001&salestrNo=6005&tlidSrchWd=%EC%BD%94%EB%8B%A5%20%EB%A6%B4%EB%A0%89%EC%8A%A4%ED%95%8F&srchPgNo=1";
	    }else if(it_uid==13){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000588111134&siteNo=6001&salestrNo=6005&tlidSrchWd=%EB%B9%84%EB%8B%88&srchPgNo=1";
	    }else if(it_uid==14){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000522968417&siteNo=6001&salestrNo=6005&tlidSrchWd=%ED%8F%B4%EB%A1%9C%20%EB%B2%A0%EC%96%B4%20%EC%9A%B8%20%EB%B8%94%EB%A0%8C%EB%93%9C%20%EB%B9%84%EB%8B%88&srchPgNo=1";
	    }else if(it_uid==15){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000580654021&siteNo=6001&salestrNo=6005&tlidSrchWd=%EC%8A%A4%ED%8F%AC%EC%B8%A0%EC%9B%A8%EC%96%B4%20%EC%97%90%EC%84%BC%EC%85%9C%20%ED%81%AC%EB%A1%AD&srchPgNo=1";
	    }else if(it_uid==16){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000027512377&siteNo=6001&salestrNo=6005&tlidSrchWd=%ED%8C%90%EB%8F%84%EB%9D%BC%20%EB%B0%98%EC%A7%80&srchPgNo=1";
	    }else if(it_uid==17){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000033397754&siteNo=6001&salestrNo=6005&tlidSrchWd=%ED%8C%90%EB%8F%84%EB%9D%BC%20%EB%93%9C%EB%A1%AD%EB%A0%9B%20%EB%B0%98%EC%A7%80&srchPgNo=1";
	    }else if(it_uid==18){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000583338293&siteNo=6001&salestrNo=6005&tlidSrchWd=%ED%83%91%ED%85%90%20%EC%BF%A8%ED%84%B0%EC%B9%98%20%ED%85%8C%EC%9D%B4%ED%8D%BC%EB%93%9C&srchPgNo=1";
	    }else if(it_uid==19){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000596885957&siteNo=6001&salestrNo=6005&tlidSrchWd=%EC%97%90%EC%9E%87%EC%84%B8%EC%BB%A8%EC%A6%88%20%EB%B2%A8%ED%8A%B8&srchPgNo=1";
	    }else if(it_uid==20){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000588526777&siteNo=6001&salestrNo=2048&tlidSrchWd=%ED%83%91%ED%85%90%20%EC%99%80%EC%9D%B4%EB%93%9C%20%EB%B2%A4%EB%94%A9%20%EB%8D%B0%EB%8B%98&srchPgNo=1";
	    }else if(it_uid==21){
	    	emartUrl="https://emart.ssg.com/item/itemView.ssg?itemId=1000595753129&siteNo=6001&salestrNo=6005&tlidSrchWd=%EB%82%98%EC%9D%B4%ED%82%A4%20%EC%96%91%EB%A7%90%20FQ0326&srchPgNo=1";
	    }else {
            // 기타 경우에 대한 처리
            return null;
        }

        // URL을 이용하여 상품 정보 크롤링
        Document emartDoc = Jsoup.connect(emartUrl).get();
        Elements emartItems = emartDoc.select("div.cdtl_row_top");
        List<ProductE> emartProducts = new ArrayList<>();

        for (Element item : emartItems) {
            // 상품 정보 추출
            ProductE productE = extractProductE(item, it_uid);
            if (productE != null) {
                emartProducts.add(productE);
            }
        }

        return emartProducts;
    }

    
    private List<ProductS> crawlSsg(int it_uid) throws IOException{
    	String ssgUrl;
    	if (it_uid == 10) {
            // it_uid가 1일 때의 URL 설정
    		ssgUrl = "https://www.ssg.com/item/itemView.ssg?itemId=1000527004951&siteNo=6004&salestrNo=6005&tlidSrchWd=%EC%97%A0%EC%97%98%EB%B9%84%20N-COVER%20%EC%96%B8%EC%8A%A4%ED%8A%B8%EB%9F%AD%EC%B3%90%20%EB%B3%BC%EC%BA%A1%20LA&srchPgNo=1&src_area=ssglist";
        } else if (it_uid == 11) {
            // it_uid가 2일 때의 URL 설정
        	ssgUrl = "https://www.ssg.com/item/itemView.ssg?itemId=1000574432942&siteNo=6004&salestrNo=6005&tlidSrchWd=%EA%B2%8C%EC%8A%A4%20%EB%82%A8%EC%84%B1%EB%B0%98%ED%8C%94%ED%8B%B0&srchPgNo=1&src_area=ssglist";
        }else if(it_uid==12){
        	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000577135659&siteNo=6004&salestrNo=6005";
	    }else if(it_uid==13){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000588111134&siteNo=6004&salestrNo=6005&tlidSrchWd=%EC%95%84%EB%AF%B8%ED%95%98%ED%8A%B8%EB%A1%9C%EA%B3%A0%EB%B9%84%EB%8B%88&srchPgNo=1&src_area=ssglist";
	    }else if(it_uid==14){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000522968410&siteNo=6004&salestrNo=6005&tlidSrchWd=%ED%8F%B4%EB%A1%9C%20%EB%B9%84%EB%8B%88&srchPgNo=1&src_area=ssglist";
	    }else if(it_uid==15){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000069995946&siteNo=6009&salestrNo=1010&tlidSrchWd=%EC%8A%A4%ED%8F%AC%EC%B8%A0%EC%9B%A8%EC%96%B4%20%EC%97%90%EC%84%BC%EC%85%9C%20%ED%81%AC%EB%A1%AD%20%EB%B0%98%ED%8C%94%ED%8B%B0%EC%85%94%EC%B8%A0&srchPgNo=1&src_area=ssglist";
	    }else if(it_uid==16){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000280073867&siteNo=6004&salestrNo=6005&tlidSrchWd=%ED%8C%90%EB%8F%84%EB%9D%BC%20%EB%A7%81%ED%81%AC%EB%93%9C&srchPgNo=1&src_area=ssglist&advertBidId=9999999998";
	    }else if(it_uid==17){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000027675223&siteNo=6004&salestrNo=6005&tlidSrchWd=%EB%93%9C%EB%A1%AD%EB%A0%9B%20%EC%8B%A4%EB%B2%84&srchPgNo=1&src_area=ssglist";
	    }else if(it_uid==18){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000583338293&siteNo=6004&salestrNo=6005&tlidSrchWd=%ED%83%91%ED%85%90%20%ED%85%8C%EC%9D%B4%ED%8D%BC%EB%93%9C%20%EC%8A%AC%EB%A0%89%EC%8A%A4&srchPgNo=1&src_area=ssglist";
	    }else if(it_uid==19){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000575888348&siteNo=6004&salestrNo=6005&tlidSrchWd=%EC%97%90%EC%9E%87%EC%84%B8%EC%BB%A8%EC%A6%88%20%EB%B2%A8%ED%8A%B8&srchPgNo=1&src_area=ssglist";
	    }else if(it_uid==20){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000588526777&siteNo=6001&salestrNo=2048&tlidSrchWd=%ED%83%91%ED%85%90%20%EC%99%80%EC%9D%B4%EB%93%9C%20%EB%B2%A4%EB%94%A9%20%EB%8D%B0%EB%8B%98&srchPgNo=1&src_area=ssglist";
	    }else if(it_uid==21){
	    	ssgUrl="https://www.ssg.com/item/itemView.ssg?itemId=1000595720981&siteNo=6004&salestrNo=6005&tlidSrchWd=FQ0326&srchPgNo=1&src_area=ssglist";
	    }else {
            // 기타 경우에 대한 처리
            return null;
        }
    	
    	Document ssgDoc = Jsoup.connect(ssgUrl).get();
    	Elements ssgElements = ssgDoc.select("div.cdtl_row_top");
        List<ProductS> ssgProducts = new ArrayList<>();
     
        for (Element item : ssgElements) {
            ProductS productS = extractProductS(item, 0);
            if (productS != null) {
            	ssgProducts.add(productS);
            }
        }

        return ssgProducts;
    }

    private ProductM extractProductM(Element item, int it_uid) {
        try {
            String productName = item.select("p.list_info a[name=goods_link]").text().trim();
            String imageUrl = item.select("img.lazy").attr("data-original");
            if (imageUrl.isEmpty()) {
                imageUrl = "";
            }

            if (it_uid == 10 && productName.contains("N-COVER 언스트럭쳐 볼캡 LA (Black)")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            } else if (it_uid == 11 && productName.contains("남성 오리지널삼각로고반팔")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price del").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            }else if (it_uid == 12 && productName.contains("스퀘어로고 릴렉스핏 볼캡 BLUE")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price del").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            }else if (it_uid == 13 && productName.contains("하트로고 ADC 비니 - 그레이 / BFUHA106018084")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            }else if (it_uid == 14 && productName.contains("폴로 베어 울 블렌드 비니 - 블랙")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            }else if (it_uid == 15 && productName.contains("스포츠웨어 에센셜 크롭 티셔츠 W - 화이트:블랙 / BV6176-100")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            } else if (it_uid == 16 && productName.contains("링크드 러브 링_190980")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            } else if (it_uid == 17 && productName.contains("드롭렛 링_190945CZ")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            } else if (it_uid == 18 && productName.contains("여성) 쿨터치 테이퍼드 슬랙스 SET MSE2KG2002_MSE2PP2552")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price del").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            } else if (it_uid == 19 && productName.contains("D링 포인트 25mm 벨트  블랙 (19418OWY95)")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            } else if (it_uid == 20 && productName.contains("(COOL) 와이드 밴딩 데님_MSD2DP2905")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price del").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            }else if (it_uid == 21 && productName.contains("에브리데이 플러스 쿠션 크루 삭스(1켤레) M - 화이트:바시티 로얄:블랙 / FQ0326-100")) {
                // 가격 정보 추출
                Element priceElement = item.select("p.price").first();
                String priceText = priceElement.text().trim();
                String priceStr = priceText.replaceAll("[^0-9]", ""); // 숫자와 원화 기호만 남기고 제거
                int originalPrice = Integer.parseInt(priceStr);

                // ProductM 객체 생성하여 반환
                return new ProductM(null, productName, originalPrice, 0, 0, imageUrl);
            } else {
                // 조건에 맞지 않는 경우 null 반환
                return null;
            }
        } catch (NumberFormatException e) {
            System.out.println("가격 정보를 숫자로 변환할 수 없습니다.");
        } catch (Exception e) {
            System.out.println("상품 정보를 추출하는 동안 오류가 발생했습니다: " + e.getMessage());
        }

        return null; // 예외 발생 시 null 반환
    }


    private ProductE extractProductE(Element item, int it_uid) {
        try {
            // 브랜드 이름 추출
            String brandName = item.select("a.cdtl_info_tit_link").text().trim();

            // 상품 이름 추출
            String productName = item.select("span.cdtl_info_tit_txt").text().trim().replace("\n", "");

            // 최적가 정보 추출
            Element bestPriceElement = item.select("span.cdtl_new_price > em.ssg_price").first();
            String bestPriceStr = bestPriceElement.text().replaceAll("[^0-9]", "");
            int originalPrice = Integer.parseInt(bestPriceStr);

            // 판매가 정보 추출
            Element salePriceElement = item.select("span.cdtl_old_price > em.ssg_price").first();
            int discountPrice = 0; // 판매가 초기값 설정
            if (salePriceElement != null) {
                String salePriceStr = salePriceElement.text().replaceAll("[^0-9]", "");
                discountPrice = Integer.parseInt(salePriceStr);
            }
            
            // 할인율 계산
            double discountRate = 0.0;
            if (discountPrice != 0) {
                discountRate = ((discountPrice - originalPrice) / (double) discountPrice) * 100;
            }

            // 이미지 URL 추출
            String imageUrl = item.select("img").attr("src");

            // ProductE 객체 생성하여 반환
            return new ProductE(brandName, productName, originalPrice, discountPrice, discountRate, imageUrl);

        } catch (NumberFormatException e) {
            System.out.println("가격 정보를 숫자로 변환할 수 없습니다.");
            return null;
        } catch (Exception e) {
            System.out.println("상품 정보 추출 중 오류 발생: " + e.getMessage());
            return null;
        }
    }

    private ProductS extractProductS(Element item, int it_uid) {
        try {
            // 브랜드 이름 추출
            String brandName = item.select("a.cdtl_info_tit_link").text().trim();

            // 상품 이름 추출
            String productName = item.select("span.cdtl_info_tit_txt").text().trim().replace("\n", "");

            // 최적가 정보 추출
            Element bestPriceElement = item.select("span.cdtl_new_price > em.ssg_price").first();
            String bestPriceStr = bestPriceElement.text().replaceAll("[^0-9]", "");
            int bestPrice = Integer.parseInt(bestPriceStr);

            // 판매가 정보 추출
            Element salePriceElement = item.select("span.cdtl_old_price > em.ssg_price").first();
            String salePriceStr = salePriceElement.text().replaceAll("[^0-9]", "");
            int salePrice = Integer.parseInt(salePriceStr);

            // 할인율 계산
            double discountRate = ((salePrice - bestPrice) / (double) salePrice) * 100;

            // 이미지 URL 추출
            String imageUrl = item.select("img").attr("src");

            // ProductS 객체 생성하여 반환
            return new ProductS(brandName, productName, salePrice, bestPrice, discountRate, imageUrl);

        } catch (NumberFormatException e) {
            System.out.println("가격 정보를 숫자로 변환할 수 없습니다.");
            return null;
        } catch (Exception e) {
            System.out.println("상품 정보 추출 중 오류 발생: " + e.getMessage());
            return null;
        }
    }
}