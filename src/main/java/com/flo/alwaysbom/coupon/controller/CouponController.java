package com.flo.alwaysbom.coupon.controller;

import com.flo.alwaysbom.coupon.service.CouponService;
import com.flo.alwaysbom.coupon.vo.CouponVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class CouponController {

    private final CouponService couponService;

    @GetMapping("/coupon")
    public String goCoupon(Model model) {
        List<CouponVo> list = couponService.findByStatus(null);
        model.addAttribute("couponList", list);
        return "coupon/list";
    }

    @GetMapping("/api/coupon/list")
    @ResponseBody
    public List<CouponVo> list(Integer status) {
        System.out.println("status = " + status);
        return couponService.findByStatus(status);
    }
}
