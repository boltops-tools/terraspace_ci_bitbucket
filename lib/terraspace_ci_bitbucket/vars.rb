module TerraspaceCiBitbucket
  class Vars
    # Hash of properties to store
    def data
      {
        build_system: "bitbucket",
        host: host,
        full_repo: full_repo,
        branch_name: branch_name,
        # urls
        pr_url: pr_url,
        build_url: build_url,
        branch_url: branch_url,
        # additional properties
        build_type: build_type,   # required IE: pull_request or push
        pr_number: pr_number,  # set when build_type=pull_request
        sha: sha,
        # additional properties
        # commit_message: commit_message,
        build_id: build_id,
        build_number: ENV['REPLACE_ME'],
      }
    end

    def host
      ENV['BITBUCKET_HOST'] || 'https://bitbucket.org'
    end

    def commit_url
      "#{host}/#{full_repo}/commits/#{sha}"
    end

    def branch_url
      "#{host}/#{full_repo}/branch/#{branch_name}"
    end

    def pr_url
      "#{host}/#{full_repo}/pull-requests/#{pr_number}" if pr_number
    end

    def build_url
      "#{repo_url}/addon/pipelines/home#!/results/#{build_id}"
    end

    def pr_number
      ENV['BITBUCKET_PR_ID']
    end

    def repo_url
      ENV['BITBUCKET_GIT_HTTP_ORIGIN']
    end

    def branch_name
      ENV['BITBUCKET_BRANCH']
    end

    def sha
      ENV['BITBUCKET_COMMIT']
    end

    def full_repo
      ENV['BITBUCKET_REPO_FULL_NAME']
    end

    def build_id
      ENV['BITBUCKET_BUILD_NUMBER']
    end

    def build_type
      'pull_request' if ENV['BITBUCKET_PR_ID']
    end
  end
end
