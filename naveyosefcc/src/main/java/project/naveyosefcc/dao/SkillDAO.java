package project.naveyosefcc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import project.naveyosefcc.entity.Skill;

public interface SkillDAO extends JpaRepository<Skill, String> {
}
