package com.example.student_management_app.Repository;
import java.util.List;

import com.example.student_management_app.Model.students;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface student_re extends JpaRepository<students, Integer> {

	students findById(int id);

	List<students> findAllByNameContaining(String str);

	List<students> findAllByEmailContaining(String str);

	List<students> findAllByGenderContaining(String str);

	List<students> findAllByTeamsContaining(String str);
	
	List<students> findAllByNameContainingAndEmailContainingAndGenderContainingAndTeamsContaining(String str, String str1,String str2, String str3 );

	List<students> findAllByOrderByIdAsc();

	
	
	

	
}