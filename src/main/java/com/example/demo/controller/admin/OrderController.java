package com.example.demo.controller.admin;

import com.example.demo.domain.Order;
import com.example.demo.repository.OrderRepository;
import com.example.demo.service.OrderService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class OrderController {
    private final OrderService orderService;
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }
    @GetMapping("/admin/order")
    public String getOrderPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try{
            if(pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
            else{

            }
        }
        catch(Exception e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 1);
        Page<Order> ors = this.orderService.getAllOrders(pageable);
        List<Order> orders = ors.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ors.getTotalPages());
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id).get();
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetails());
        model.addAttribute("id", id);

        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id).get();
        model.addAttribute("newOrder", order);
        model.addAttribute("orderDetails", order.getOrderDetails());
        model.addAttribute("id", id);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateOrderDetail(@ModelAttribute("newOrder") Order order) {
        this.orderService.updateOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String deleteOrder(Model model, @PathVariable long id) {
        model.addAttribute("newOrder", new Order());
        model.addAttribute("id", id);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.deleteOrderById(order.getId());
        return "redirect:/admin/order";
    }
}
