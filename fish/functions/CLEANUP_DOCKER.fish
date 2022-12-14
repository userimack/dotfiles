function CLEANUP_DOCKER
    docker system df
    #docker image prune -a
    docker images | grep "none" | tr -s " " | cut -d " " -f 3 | uniq |  while read -r line; do echo -e "Removing > ${line}"; docker rmi -f ${line}; done
    echo  -e "-- CLEAN UP OF DOCKER IMAGES IS DONE --\n\n"

    docker images > /tmp/.docker_image_ids
    # docker container ls -a | tr -s " " | cut -d " " -f2 | while read -r id; do if [ grep ${id} /tmp/.docker_image_ids ];  echo "> ${id}"; done
    # docker container ls -a | tr -s " " | tail +2  | cut -d " " -f2 | while read -r id; do; if [ $(grep -c "${id}" /tmp/.docker_image_ids) -eq 0 ]; then echo "> Removing container - ${id}"; docker container rm "${id}"; fi; done
    docker system df
end
