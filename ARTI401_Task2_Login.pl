user('student', '1234').
user('admin', 'admin123').

login :-
    login_attempts(3).

login_attempts(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

login_attempts(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (   user(Username, Password)
    ->  write('Login Successful'), nl
    ;   write('Login Unsuccessful'), nl,
        Remaining is Attempts - 1,
        login_attempts(Remaining)
    ).
