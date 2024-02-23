package kr.co.project.goods.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.project.common.pageing.PageInfo;
import kr.co.project.common.pageing.Pagination;
import kr.co.project.common.upload.MultiUploadFile;
import kr.co.project.common.upload.UploadFile;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.dto.GoodsPhotosDTO;
import kr.co.project.goods.model.service.GoodsServiceImpl;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsServiceImpl goodsService;

	@GetMapping("/list.do")
	public String goodsList(Model model, @RequestParam(value = "cpage", defaultValue = "1") int cpage, GoodsDTO goods) {

		int listCount = goodsService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);

		List<GoodsDTO> list = goodsService.selectListAll(pi, goods);
		model.addAttribute("list", list);
		return "foodStore/products";
	}

	@GetMapping("/detail.do")
	public String detailBoard(@RequestParam(value = "g_no") int g_no, Model model, HttpServletRequest request,
			HttpSession session) {
		int mno = (int) session.getAttribute("mno");
		GoodsDTO result = goodsService.detailGoods(g_no);

		GoodsDTO thumbnail = goodsService.detailGoods(g_no);
		thumbnail.setGp_type(1);
		GoodsDTO detailedImage = goodsService.detailGoods(g_no);
		detailedImage.setGp_type(2);
		List<GoodsPhotosDTO> thumbnailList = goodsService.goodsPhotosList(thumbnail);
		List<GoodsPhotosDTO> detailedImagelList = goodsService.goodsPhotosList(detailedImage);

		if (!Objects.isNull(result)) {
			model.addAttribute("m_no", mno);
			model.addAttribute("goods", result);
			model.addAttribute("thumbnailList", thumbnailList);
			model.addAttribute("detailedImagelList", detailedImagelList);
			return "foodStore/productDetail";
		} else {

			return "common/error";
		}
	}

	@PostMapping("/addGoods.do")
	public String addGoods(GoodsDTO goodsDTO, MultipartFile upload, HttpSession session, Model model) {
//		int m_no = (int) session.getAttribute("mno");

		if (!upload.isEmpty()) {
			UploadFile.goodsUploadMethod(upload, goodsDTO, session);
		}

		int result = goodsService.addGoods(goodsDTO);
		if (result > 0) {
//			model.addAttribute("goods", result);
			return "redirect:/goods/list.do";
		} else {
			System.out.println("상품 등록 실패");
			return "common/error";
		}
	}

	@PostMapping("/manyPhotosGoods.do")
	public String manyPhotosGoods(
			GoodsDTO goodsDTO, 
			List<MultipartFile> multiFileList, 
			HttpSession session,
			Model model) {
		List<GoodsPhotosDTO> goodsPhotoList = new ArrayList<>();
		List<GoodsPhotosDTO> detailPhotoList = new ArrayList<>();
		if (goodsPhotoList == null) {
			goodsPhotoList = new ArrayList<>();
			System.out.println("빌공");
		}
		if (multiFileList != null && !multiFileList.isEmpty()) {
			MultiUploadFile.goodsUploadMethod(multiFileList, session, goodsDTO, goodsPhotoList, detailPhotoList);
		} else {
			System.out.println("사진이 없음 수고하세요");
		}
		int result = goodsService.manyPhotosGoods(goodsDTO, goodsPhotoList, detailPhotoList);
		if (result > 0) {
			return "redirect:/goods/list.do";
		} else {
			System.out.println("상품 등록 실패");
			return "common/error";
		}
	}
}
