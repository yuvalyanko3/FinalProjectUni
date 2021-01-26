package project.naveyosefcc.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public abstract class DashboardDAOImpl {
    private DashboardDAO dashboardDAO;

    @Autowired
    public void setDashboardDAO(DashboardDAO dashboardDAO) {
        this.dashboardDAO = dashboardDAO;
    }
}
