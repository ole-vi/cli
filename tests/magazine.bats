#!/usr/bin/env bats
load test-helper

@test "$clinom magazine magpi" {
  run "${clicmd}" magazine magpi
  assert_success
}

@test "$clinom magazine magpi latest" {
  run "${clicmd}" magazine magpi latest
  assert_output -p 'MagPi93.pdf already exists, exiting...'
}

@test "$clinom magazine magpi all" {
  run "${clicmd}" magazine magpi all
  assert_success
}

@test "$clinom magazine hackspace" {
  run "${clicmd}" magazine hackspace
  assert_output -p "HackSpace magazine is packed with projects for fixers and tinkerers of all abilities. We'll teach you new techniques and give you refreshers on familiar ones, from 3D printing, laser cutting, and woodworking to electronics and Internet of Things."
}

@test "$clinom magazine hackspace latest" {
  run "${clicmd}" magazine hackspace latest
  assert_success
}

@test "$clinom magazine hackspace all" {
  run "${clicmd}" magazine hackspace all
  assert_success
}

