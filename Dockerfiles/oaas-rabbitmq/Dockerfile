FROM rabbitmq:3.6-alpine
LABEL source "https://github.com/docker-library/rabbitmq/blob/b9eda3e4665c24db70a9a290fddf33bc5c567b10/3.6/alpine/management/Dockerfile"
LABEL modified by Jung-In.Jung(call518@gmail.com)
COPY Dockerfile /Dockerfile
RUN rabbitmq-plugins enable --offline rabbitmq_management
# extract "rabbitmqadmin" from inside the "rabbitmq_management-X.Y.Z.ez" plugin zipfile
# see https://github.com/docker-library/rabbitmq/issues/207
RUN set -eux; \
	erl -noinput -eval ' \
		{ ok, AdminBin } = zip:foldl(fun(FileInArchive, GetInfo, GetBin, Acc) -> \
			case Acc of \
				"" -> \
					case lists:suffix("/rabbitmqadmin", FileInArchive) of \
						true -> GetBin(); \
						false -> Acc \
					end; \
				_ -> Acc \
			end \
		end, "", init:get_plain_arguments()), \
		io:format("~s", [ AdminBin ]), \
		init:stop(). \
	' -- /plugins/rabbitmq_management-*.ez > /usr/local/bin/rabbitmqadmin; \
	[ -s /usr/local/bin/rabbitmqadmin ]; \
	chmod +x /usr/local/bin/rabbitmqadmin; \
	apk add --no-cache python; \
	rabbitmqadmin --version
EXPOSE 15671 15672
