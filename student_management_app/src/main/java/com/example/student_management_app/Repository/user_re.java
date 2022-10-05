package com.example.student_management_app.Repository;
import com.example.student_management_app.Model.users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface user_re extends JpaRepository<users, Integer> {

	users findByUsername(String a);

	// Iterable<Diadiemdulich> findByMien(Integer id)
}