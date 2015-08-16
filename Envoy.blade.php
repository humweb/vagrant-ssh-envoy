@servers(['vm' => 'vagrant@vagrant'])

@setup
    $projectDir = $path ?: '/vagrant/www/testing.dev/humweb/formbuilder';
@endsetup

@task('install')
    cd {{ $projectDir }}
    composer install
@endtask

@task('update')
    cd {{ $projectDir }}
    composer update
@endtask

@task('gulp')
    cd {{ $projectDir }}
    gulp
@endtask


@task('ls')
cd {{ $projectDir }}
ls
@endtask
