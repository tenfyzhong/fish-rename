function test_rename -a cmd -a succ
    @echo "=====$cmd====="
    set home (command mktemp -d)
    cd $home

    touch hello world
    rename -c "$cmd" *

    if test $succ -eq 1
        @test 'file hefoofooo'  -f hefoofooo 
        @test 'file worfood'  -f worfood 
        @test 'no file hello'  ! -f hello 
        @test 'no file hello'  ! -f world 
    else
        @test 'file hello'  -f hello 
        @test 'file hello'  -f world 
    end

    rm -rf $home
end

test_rename 'string replace -a "l" "foo"' 1
test_rename 'sed "s/l/foo/g"' 1
test_rename 'string replace -a "foo" "bar"' 0
test_rename 'sed "s/foo/bar/g"' 0
