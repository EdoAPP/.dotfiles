function alloydb-fms-staging --wraps=alloydb-auth-proxy\ \'projects/fms-staging-f6db2fd/locations/us-central1/clusters/fms/instances/primary\?port=5433\'\ --public-ip\ --auto-iam-authn --description alias\ alloydb-fms-staging\ alloydb-auth-proxy\ \'projects/fms-staging-f6db2fd/locations/us-central1/clusters/fms/instances/primary\?port=5433\'\ --public-ip\ --auto-iam-authn
  alloydb-auth-proxy 'projects/fms-staging-f6db2fd/locations/us-central1/clusters/fms/instances/primary?port=5433' --public-ip --auto-iam-authn $argv
        
end
