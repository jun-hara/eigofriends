Rake::Task["assets:precompile"].clear
   namespace :assets do
     task 'precompile' do
     sh "NODE_OPTIONS=--openssl-legacy-provider rake webpacker:compile"
   end
end
