if [[ $1 == 'test' ]]
then
    echo 'you are starting the test'
    if [[ $2 == '' ]]
    then
        mvn clean test
    else
        mvn clean test -Dkarate.options="--tags @$2"
    fi
fi    
