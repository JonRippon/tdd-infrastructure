driver:
  name: ec2
  region: ${region}
  availability_zone: ${availability_zone}
  require_chef_omnibus: true
  subnet_id: ${public_subnet_id}
  associate_public_ip: true
  interface: dns

provisioner:
  name: chef_solo

platforms:
  - name: ubuntu
    driver:
      image_id: ${ami_id}
    transport:
      username: ubuntu

verifier:
  name: inspec

suites:
  - name: default
    verifier:
      inspec_tests:
        - test/integration/default
    attributes:
      mongodb_host: ${mongodb_host_ip}