package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.AuctionEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.AuctionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuctionService {
    @Autowired
    private AuctionRepository auctionRepository;

    public AuctionEntity createAuction(UserEntity user, AuctionEntity auction, ProductEntity product) {
        if (product.getIs_auction()) {
            auction.setUser(user);
            auction.setProduct(product);
            return auctionRepository.save(auction);
        }
        return null; //TODO:나중에 에러 처리 해야할듯
    }

    //내 경매 참여 내역
    public List<AuctionEntity> myAuctionList(UserEntity user) {
        return auctionRepository.findAllByUser(user);
    }

    //상품별 경매 참여 내역
    public List<AuctionEntity> auctionList(ProductEntity product) {
        return auctionRepository.findAllByProductOrderByPriceDesc(product);
    }
}
