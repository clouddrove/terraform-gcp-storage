// Managed By : CloudDrove
// Description : This Terratest is used to test the Terraform storage module.
// Copyright @ CloudDrove. All Right Reserved.
package test

import (
	"testing"
	"strings"
	"github.com/stretchr/testify/assert"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func Test(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// Source path of Terraform directory.
		TerraformDir: "../../_example",
		Upgrade: true,
	}

	// This will run 'terraform init' and 'terraform application' and will fail the test if any errors occur
	terraform.InitAndApply(t, terraformOptions)

	// To clean up any resources that have been created, run 'terraform destroy' towards the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// To get the value of an output variable, run 'terraform output'
	storageBucketId := strings.Join(terraform.OutputList(t, terraformOptions, "id")," ")
	Tags := terraform.OutputMap(t, terraformOptions, "tags")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, "clouddrove-secure-bucket-test-private", storageBucketId)
	assert.Equal(t, "clouddrove-secure-bucket-test-private", Tags["Name"])
}