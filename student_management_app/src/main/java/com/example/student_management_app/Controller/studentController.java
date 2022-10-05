package com.example.student_management_app.Controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.xml.bind.DatatypeConverter;

import com.example.student_management_app.Repository.student_re;
import com.example.student_management_app.Model.students;
import com.example.student_management_app.Model.users;
import com.example.student_management_app.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@ResponseBody
public class studentController {

	@Autowired
	student_re student_re;
	@Autowired
	user_re user_re;
	
	
	
	@PostMapping("/api/login")
	public Map login(@RequestBody users stu) throws NoSuchAlgorithmException {
		
		users s = user_re.findByUsername( stu.getUsername()) ;
		if(s != null) {
			
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        md.update(  stu.getPassword().getBytes());
	        byte[] digest = md.digest();
	        String myHash = DatatypeConverter.printHexBinary(digest).toLowerCase();
	        System.out.print(myHash) ;
	        
			if( myHash.equals(   s.getPassword()    )             ) {
				System.out.print("ok ok ok") ;
				Map obj = new HashMap();
				obj.put("key", "abcdef."+ s.getUsername());
				return obj ;
			}
		}
		
		Map obj = new HashMap();
		obj.put("key", null);
		return obj;
	}
	
	@GetMapping("/api/student")
	public List<students> students() {
		List<students> students1 = student_re.findAllByOrderByIdAsc();
		return students1;
	}
	
	

	@GetMapping("/api/user")
	public List<users> user() {
		List<users> user1 = user_re.findAll();
		return user1;
	}
	@GetMapping("/api/student/{id}")
	public Optional<students> findid(@PathVariable Integer id) {
		Optional<students> abcStudent = student_re.findById(id);
		return abcStudent;
	}
	@PostMapping("/api/student/{id}")
	public students update(@RequestBody students students) {

		student_re.save(students);

		return student_re.findById(students.getId());
	}
	
	
	@PostMapping("/api/student")
	public students update99(@RequestBody students students) {

		student_re.save(students);

		return students;
	}
	@PostMapping("/api/addUser")
	public users addUser(@RequestBody users ss) throws NoSuchAlgorithmException {
		
		users ab = user_re.findByUsername(ss.getUsername())  ;
		
		if(ab == null) {
			
		
		
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(  ss.getPassword().getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter.printHexBinary(digest).toLowerCase();
        System.out.print(myHash) ;
		
        ss.setPassword(myHash)  ;
		user_re.save( ss );

		return ss;
		}else
			return null;
	}

	@RequestMapping(value = "/api/student/{id}", method = RequestMethod.DELETE)
	public void deleteLocation(@PathVariable int id) {
		student_re.deleteById(id);
	}
	
	
	@GetMapping("/api/student-find/{str}")
	public List<students> student_find( @PathVariable String str ) {
		
			if(str.equals("-999")) {
				List<students> student9 = student_re.findAll();
				return student9 ;
			}
		
		
		
			int id_stu = -888;
			
			try {
				id_stu = Integer.parseInt(str);
				
			}
			catch(Exception e) {
			  
			}
			
			List<students> student = student_re.findAllByNameContaining( str );
			
			
			if( id_stu != -888 && student.isEmpty() ) {
				
				students stu = student_re.findById(id_stu) ;
				student.add(stu)   ;
				return student ;
			}
			
			return student;
		
		
		
		
	}
	
	@GetMapping("/api/student-find-email/{str}")
	public List<students> student_find_email( @PathVariable String str ) {
		
			if(str.equals("-999")) {
				List<students> student9 = student_re.findAll();
				return student9 ;
			}
		

			
			List<students> student = student_re.findAllByEmailContaining( str );

			
			return student;
		

	}
	
	@GetMapping("/api/student-find-gender/{str}")
	public List<students> student_find_gender( @PathVariable String str ) {
		
			if(str.equals("-999")  ||  str.equals("ALL") ) {
				List<students> student9 = student_re.findAll();
				return student9 ;
			}
		
			List<students> student = student_re.findAllByGenderContaining( str );

			
			return student;
		

	}
	
	@GetMapping("/api/student-find-team/{str}")
	public List<students> student_find_team( @PathVariable String str ) {
		
			if(str.equals("-999")  ||  str.equals("ALL") ) {
				List<students> student9 = student_re.findAll();
				return student9 ;
			}
		
			List<students> student = student_re.findAllByTeamsContaining( str );

			
			return student;
		

	}
	
	@PostMapping("/api/student-find-student")
	public List<students> student_find_student9(@RequestBody students st) {
		List<students> st1 = student_re.findAllByNameContainingAndEmailContainingAndGenderContainingAndTeamsContaining(st.getName(), st.getEmail(), st.getGender(), st.getTeams());
		return st1;
		 
	
	
	
	
	
	}
}