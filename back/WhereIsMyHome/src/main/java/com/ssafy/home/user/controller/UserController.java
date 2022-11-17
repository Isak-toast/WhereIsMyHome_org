package com.ssafy.home.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.home.user.dto.User;
import com.ssafy.home.user.service.UserService;

import lombok.RequiredArgsConstructor;

@CrossOrigin
@RequiredArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {

	private final UserService userService;

	@PostMapping("/signup")
	public ResponseEntity<?> signUp(@RequestBody User user) {
		userService.signUp(user);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@PostMapping("/signin")
	public ResponseEntity<?> signIn(@RequestBody User user) {
		return ResponseEntity.ok().body(userService.signIn(user.getEmail(), user.getPassword()));
	}

	@GetMapping("/{email}")
	public ResponseEntity<?> getUser(@PathVariable String email) {
		return new ResponseEntity<User>(userService.getUser(email), HttpStatus.OK);
	}

	@PutMapping("/{email}") // 투머로우 수정
	public ResponseEntity<?> updateUser(@RequestBody User user) {
		userService.updateUser(user);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@DeleteMapping("/{email}")
	public ResponseEntity<?> deleteUser(@PathVariable String email) {
		userService.deleteUser(email);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
