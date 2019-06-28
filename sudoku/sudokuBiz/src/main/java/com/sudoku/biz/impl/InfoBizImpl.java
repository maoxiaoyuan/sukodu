package com.sudoku.biz.impl;

import com.sudoku.biz.InfoBiz;
import com.sudoku.dao.InfoDao;
import com.sudoku.entity.Info;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("infoBizImpl")
public class InfoBizImpl implements InfoBiz {

    @Autowired
    @Qualifier("infoDao")
    private InfoDao infoDao;

    public void add(Info info) {
        infoDao.insert(info);
    }

    public List<Info> getAll() {
        return infoDao.selectAll();
    }
}
