"""Generated message classes for iam version v1.

Manages identity and access control for Google Cloud Platform resources,
including the creation of service accounts, which you can use to authenticate
to Google and make API calls.
"""
# NOTE: This file is autogenerated and should not be edited by hand.

from apitools.base.protorpclite import messages as _messages
from apitools.base.py import encoding


package = 'iam'


class AuditData(_messages.Message):
  """Audit log information specific to Cloud IAM. This message is serialized
  as an `Any` type in the `ServiceData` message of an `AuditLog` message.

  Fields:
    policyDelta: Policy delta between the original policy and the newly set
      policy.
  """

  policyDelta = _messages.MessageField('PolicyDelta', 1)


class Binding(_messages.Message):
  """Associates `members` with a `role`.

  Fields:
    members: Specifies the identities requesting access for a Cloud Platform
      resource. `members` can have the following values:  * `allUsers`: A
      special identifier that represents anyone who is    on the internet;
      with or without a Google account.  * `allAuthenticatedUsers`: A special
      identifier that represents anyone    who is authenticated with a Google
      account or a service account.  * `user:{emailid}`: An email address that
      represents a specific Google    account. For example, `alice@gmail.com`
      or `joe@example.com`.  * `serviceAccount:{emailid}`: An email address
      that represents a service    account. For example, `my-other-
      app@appspot.gserviceaccount.com`.  * `group:{emailid}`: An email address
      that represents a Google group.    For example, `admins@example.com`.  *
      `domain:{domain}`: A Google Apps domain name that represents all the
      users of that domain. For example, `google.com` or `example.com`.
    role: Role that is assigned to `members`. For example, `roles/viewer`,
      `roles/editor`, or `roles/owner`. Required
  """

  members = _messages.StringField(1, repeated=True)
  role = _messages.StringField(2)


class BindingDelta(_messages.Message):
  """One delta entry for Binding. Each individual change (only one member in
  each entry) to a binding will be a separate entry.

  Enums:
    ActionValueValuesEnum: The action that was performed on a Binding.
      Required

  Fields:
    action: The action that was performed on a Binding. Required
    member: A single identity requesting access for a Cloud Platform resource.
      Follows the same format of Binding.members. Required
    role: Role that is assigned to `members`. For example, `roles/viewer`,
      `roles/editor`, or `roles/owner`. Required
  """

  class ActionValueValuesEnum(_messages.Enum):
    """The action that was performed on a Binding. Required

    Values:
      ACTION_UNSPECIFIED: Unspecified.
      ADD: Addition of a Binding.
      REMOVE: Removal of a Binding.
    """
    ACTION_UNSPECIFIED = 0
    ADD = 1
    REMOVE = 2

  action = _messages.EnumField('ActionValueValuesEnum', 1)
  member = _messages.StringField(2)
  role = _messages.StringField(3)


class CreateServiceAccountKeyRequest(_messages.Message):
  """The service account key create request.

  Enums:
    KeyAlgorithmValueValuesEnum: Which type of key and algorithm to use for
      the key. The default is currently a 4K RSA key.  However this may change
      in the future.
    PrivateKeyTypeValueValuesEnum: The output format of the private key.
      `GOOGLE_CREDENTIALS_FILE` is the default output format.

  Fields:
    keyAlgorithm: Which type of key and algorithm to use for the key. The
      default is currently a 4K RSA key.  However this may change in the
      future.
    privateKeyType: The output format of the private key.
      `GOOGLE_CREDENTIALS_FILE` is the default output format.
  """

  class KeyAlgorithmValueValuesEnum(_messages.Enum):
    """Which type of key and algorithm to use for the key. The default is
    currently a 4K RSA key.  However this may change in the future.

    Values:
      KEY_ALG_UNSPECIFIED: An unspecified key algorithm.
      KEY_ALG_RSA_1024: 1k RSA Key.
      KEY_ALG_RSA_2048: 2k RSA Key.
    """
    KEY_ALG_UNSPECIFIED = 0
    KEY_ALG_RSA_1024 = 1
    KEY_ALG_RSA_2048 = 2

  class PrivateKeyTypeValueValuesEnum(_messages.Enum):
    """The output format of the private key. `GOOGLE_CREDENTIALS_FILE` is the
    default output format.

    Values:
      TYPE_UNSPECIFIED: Unspecified. Equivalent to
        `TYPE_GOOGLE_CREDENTIALS_FILE`.
      TYPE_PKCS12_FILE: PKCS12 format. The password for the PKCS12 file is
        `notasecret`. For more information, see
        https://tools.ietf.org/html/rfc7292.
      TYPE_GOOGLE_CREDENTIALS_FILE: Google Credentials File format.
    """
    TYPE_UNSPECIFIED = 0
    TYPE_PKCS12_FILE = 1
    TYPE_GOOGLE_CREDENTIALS_FILE = 2

  keyAlgorithm = _messages.EnumField('KeyAlgorithmValueValuesEnum', 1)
  privateKeyType = _messages.EnumField('PrivateKeyTypeValueValuesEnum', 2)


class CreateServiceAccountRequest(_messages.Message):
  """The service account create request.

  Fields:
    accountId: Required. The account id that is used to generate the service
      account email address and a stable unique id. It is unique within a
      project, must be 6-30 characters long, and match the regular expression
      `[a-z]([-a-z0-9]*[a-z0-9])` to comply with RFC1035.
    serviceAccount: The ServiceAccount resource to create. Currently, only the
      following values are user assignable: `display_name` .
  """

  accountId = _messages.StringField(1)
  serviceAccount = _messages.MessageField('ServiceAccount', 2)


class Empty(_messages.Message):
  """A generic empty message that you can re-use to avoid defining duplicated
  empty messages in your APIs. A typical example is to use it as the request
  or the response type of an API method. For instance:      service Foo {
  rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);     }  The
  JSON representation for `Empty` is empty JSON object `{}`.
  """



class IamProjectsServiceAccountsCreateRequest(_messages.Message):
  """A IamProjectsServiceAccountsCreateRequest object.

  Fields:
    createServiceAccountRequest: A CreateServiceAccountRequest resource to be
      passed as the request body.
    name: Required. The resource name of the project associated with the
      service accounts, such as `projects/my-project-123`.
  """

  createServiceAccountRequest = _messages.MessageField('CreateServiceAccountRequest', 1)
  name = _messages.StringField(2, required=True)


class IamProjectsServiceAccountsDeleteRequest(_messages.Message):
  """A IamProjectsServiceAccountsDeleteRequest object.

  Fields:
    name: The resource name of the service account in the following format:
      `projects/{project}/serviceAccounts/{account}`. Using `-` as a wildcard
      for the project will infer the project from the account. The `account`
      value can be the `email` address or the `unique_id` of the service
      account.
  """

  name = _messages.StringField(1, required=True)


class IamProjectsServiceAccountsGetIamPolicyRequest(_messages.Message):
  """A IamProjectsServiceAccountsGetIamPolicyRequest object.

  Fields:
    resource: REQUIRED: The resource for which the policy is being requested.
      `resource` is usually specified as a path. For example, a Project
      resource is specified as `projects/{project}`.
  """

  resource = _messages.StringField(1, required=True)


class IamProjectsServiceAccountsGetRequest(_messages.Message):
  """A IamProjectsServiceAccountsGetRequest object.

  Fields:
    name: The resource name of the service account in the following format:
      `projects/{project}/serviceAccounts/{account}`. Using `-` as a wildcard
      for the project will infer the project from the account. The `account`
      value can be the `email` address or the `unique_id` of the service
      account.
  """

  name = _messages.StringField(1, required=True)


class IamProjectsServiceAccountsKeysCreateRequest(_messages.Message):
  """A IamProjectsServiceAccountsKeysCreateRequest object.

  Fields:
    createServiceAccountKeyRequest: A CreateServiceAccountKeyRequest resource
      to be passed as the request body.
    name: The resource name of the service account in the following format:
      `projects/{project}/serviceAccounts/{account}`. Using `-` as a wildcard
      for the project will infer the project from the account. The `account`
      value can be the `email` address or the `unique_id` of the service
      account.
  """

  createServiceAccountKeyRequest = _messages.MessageField('CreateServiceAccountKeyRequest', 1)
  name = _messages.StringField(2, required=True)


class IamProjectsServiceAccountsKeysDeleteRequest(_messages.Message):
  """A IamProjectsServiceAccountsKeysDeleteRequest object.

  Fields:
    name: The resource name of the service account key in the following
      format: `projects/{project}/serviceAccounts/{account}/keys/{key}`. Using
      `-` as a wildcard for the project will infer the project from the
      account. The `account` value can be the `email` address or the
      `unique_id` of the service account.
  """

  name = _messages.StringField(1, required=True)


class IamProjectsServiceAccountsKeysGetRequest(_messages.Message):
  """A IamProjectsServiceAccountsKeysGetRequest object.

  Enums:
    PublicKeyTypeValueValuesEnum: The output format of the public key
      requested. X509_PEM is the default output format.

  Fields:
    name: The resource name of the service account key in the following
      format: `projects/{project}/serviceAccounts/{account}/keys/{key}`.
      Using `-` as a wildcard for the project will infer the project from the
      account. The `account` value can be the `email` address or the
      `unique_id` of the service account.
    publicKeyType: The output format of the public key requested. X509_PEM is
      the default output format.
  """

  class PublicKeyTypeValueValuesEnum(_messages.Enum):
    """The output format of the public key requested. X509_PEM is the default
    output format.

    Values:
      TYPE_NONE: <no description>
      TYPE_X509_PEM_FILE: <no description>
      TYPE_RAW_PUBLIC_KEY: <no description>
    """
    TYPE_NONE = 0
    TYPE_X509_PEM_FILE = 1
    TYPE_RAW_PUBLIC_KEY = 2

  name = _messages.StringField(1, required=True)
  publicKeyType = _messages.EnumField('PublicKeyTypeValueValuesEnum', 2)


class IamProjectsServiceAccountsKeysListRequest(_messages.Message):
  """A IamProjectsServiceAccountsKeysListRequest object.

  Enums:
    KeyTypesValueValuesEnum: Filters the types of keys the user wants to
      include in the list response. Duplicate key types are not allowed. If no
      key type is provided, all keys are returned.

  Fields:
    keyTypes: Filters the types of keys the user wants to include in the list
      response. Duplicate key types are not allowed. If no key type is
      provided, all keys are returned.
    name: The resource name of the service account in the following format:
      `projects/{project}/serviceAccounts/{account}`.  Using `-` as a wildcard
      for the project, will infer the project from the account. The `account`
      value can be the `email` address or the `unique_id` of the service
      account.
  """

  class KeyTypesValueValuesEnum(_messages.Enum):
    """Filters the types of keys the user wants to include in the list
    response. Duplicate key types are not allowed. If no key type is provided,
    all keys are returned.

    Values:
      KEY_TYPE_UNSPECIFIED: <no description>
      USER_MANAGED: <no description>
      SYSTEM_MANAGED: <no description>
    """
    KEY_TYPE_UNSPECIFIED = 0
    USER_MANAGED = 1
    SYSTEM_MANAGED = 2

  keyTypes = _messages.EnumField('KeyTypesValueValuesEnum', 1, repeated=True)
  name = _messages.StringField(2, required=True)


class IamProjectsServiceAccountsListRequest(_messages.Message):
  """A IamProjectsServiceAccountsListRequest object.

  Fields:
    name: Required. The resource name of the project associated with the
      service accounts, such as `projects/my-project-123`.
    pageSize: Optional limit on the number of service accounts to include in
      the response. Further accounts can subsequently be obtained by including
      the ListServiceAccountsResponse.next_page_token in a subsequent request.
    pageToken: Optional pagination token returned in an earlier
      ListServiceAccountsResponse.next_page_token.
  """

  name = _messages.StringField(1, required=True)
  pageSize = _messages.IntegerField(2, variant=_messages.Variant.INT32)
  pageToken = _messages.StringField(3)


class IamProjectsServiceAccountsSetIamPolicyRequest(_messages.Message):
  """A IamProjectsServiceAccountsSetIamPolicyRequest object.

  Fields:
    resource: REQUIRED: The resource for which the policy is being specified.
      `resource` is usually specified as a path. For example, a Project
      resource is specified as `projects/{project}`.
    setIamPolicyRequest: A SetIamPolicyRequest resource to be passed as the
      request body.
  """

  resource = _messages.StringField(1, required=True)
  setIamPolicyRequest = _messages.MessageField('SetIamPolicyRequest', 2)


class IamProjectsServiceAccountsSignBlobRequest(_messages.Message):
  """A IamProjectsServiceAccountsSignBlobRequest object.

  Fields:
    name: The resource name of the service account in the following format:
      `projects/{project}/serviceAccounts/{account}`. Using `-` as a wildcard
      for the project will infer the project from the account. The `account`
      value can be the `email` address or the `unique_id` of the service
      account.
    signBlobRequest: A SignBlobRequest resource to be passed as the request
      body.
  """

  name = _messages.StringField(1, required=True)
  signBlobRequest = _messages.MessageField('SignBlobRequest', 2)


class IamProjectsServiceAccountsTestIamPermissionsRequest(_messages.Message):
  """A IamProjectsServiceAccountsTestIamPermissionsRequest object.

  Fields:
    resource: REQUIRED: The resource for which the policy detail is being
      requested. `resource` is usually specified as a path. For example, a
      Project resource is specified as `projects/{project}`.
    testIamPermissionsRequest: A TestIamPermissionsRequest resource to be
      passed as the request body.
  """

  resource = _messages.StringField(1, required=True)
  testIamPermissionsRequest = _messages.MessageField('TestIamPermissionsRequest', 2)


class ListServiceAccountKeysResponse(_messages.Message):
  """The service account keys list response.

  Fields:
    keys: The public keys for the service account.
  """

  keys = _messages.MessageField('ServiceAccountKey', 1, repeated=True)


class ListServiceAccountsResponse(_messages.Message):
  """The service account list response.

  Fields:
    accounts: The list of matching service accounts.
    nextPageToken: To retrieve the next page of results, set
      ListServiceAccountsRequest.page_token to this value.
  """

  accounts = _messages.MessageField('ServiceAccount', 1, repeated=True)
  nextPageToken = _messages.StringField(2)


class Policy(_messages.Message):
  """Defines an Identity and Access Management (IAM) policy. It is used to
  specify access control policies for Cloud Platform resources.   A `Policy`
  consists of a list of `bindings`. A `Binding` binds a list of `members` to a
  `role`, where the members can be user accounts, Google groups, Google
  domains, and service accounts. A `role` is a named list of permissions
  defined by IAM.  **Example**      {       "bindings": [         {
  "role": "roles/owner",           "members": [
  "user:mike@example.com",             "group:admins@example.com",
  "domain:google.com",             "serviceAccount:my-other-
  app@appspot.gserviceaccount.com",           ]         },         {
  "role": "roles/viewer",           "members": ["user:sean@example.com"]
  }       ]     }  For a description of IAM and its features, see the [IAM
  developer's guide](https://cloud.google.com/iam).

  Fields:
    bindings: Associates a list of `members` to a `role`. Multiple `bindings`
      must not be specified for the same `role`. `bindings` with no members
      will result in an error.
    etag: `etag` is used for optimistic concurrency control as a way to help
      prevent simultaneous updates of a policy from overwriting each other. It
      is strongly suggested that systems make use of the `etag` in the read-
      modify-write cycle to perform policy updates in order to avoid race
      conditions: An `etag` is returned in the response to `getIamPolicy`, and
      systems are expected to put that etag in the request to `setIamPolicy`
      to ensure that their change will be applied to the same version of the
      policy.  If no `etag` is provided in the call to `setIamPolicy`, then
      the existing policy is overwritten blindly.
    version: Version of the `Policy`. The default version is 0.
  """

  bindings = _messages.MessageField('Binding', 1, repeated=True)
  etag = _messages.BytesField(2)
  version = _messages.IntegerField(3, variant=_messages.Variant.INT32)


class PolicyDelta(_messages.Message):
  """The difference delta between two policies.

  Fields:
    bindingDeltas: The delta for Bindings between two policies.
  """

  bindingDeltas = _messages.MessageField('BindingDelta', 1, repeated=True)


class QueryGrantableRolesRequest(_messages.Message):
  """The grantable role query request.

  Fields:
    fullResourceName: Required. The full resource name to query from the list
      of grantable roles.  The name follows the Google Cloud Platform resource
      format. For example, a Cloud Platform project with id `my-project` will
      be named `//cloudresourcemanager.googleapis.com/projects/my-project`.
  """

  fullResourceName = _messages.StringField(1)


class QueryGrantableRolesResponse(_messages.Message):
  """The grantable role query response.

  Fields:
    roles: The list of matching roles.
  """

  roles = _messages.MessageField('Role', 1, repeated=True)


class Role(_messages.Message):
  """A role in the Identity and Access Management API.

  Fields:
    description: Optional.  A human-readable description for the role.
    name: The name of the role.  When Role is used in CreateRole, the role
      name must not be set.  When Role is used in output and other input such
      as UpdateRole, the role name is the complete path, e.g.,
      roles/logging.viewer for curated roles and organizations/{organization-
      id}/roles/logging.viewer for custom roles.
    title: Optional.  A human-readable title for the role.  Typically this is
      limited to 100 UTF-8 bytes.
  """

  description = _messages.StringField(1)
  name = _messages.StringField(2)
  title = _messages.StringField(3)


class ServiceAccount(_messages.Message):
  """A service account in the Identity and Access Management API.  To create a
  service account, specify the `project_id` and the `account_id` for the
  account.  The `account_id` is unique within the project, and is used to
  generate the service account email address and a stable `unique_id`.  If the
  account already exists, the account's resource name is returned in
  util::Status's ResourceInfo.resource_name in the format of
  projects/{project}/serviceAccounts/{email}. The caller can use the name in
  other methods to access the account.  All other methods can identify the
  service account using the format
  `projects/{project}/serviceAccounts/{account}`. Using `-` as a wildcard for
  the project will infer the project from the account. The `account` value can
  be the `email` address or the `unique_id` of the service account.

  Fields:
    displayName: Optional. A user-specified description of the service
      account.  Must be fewer than 100 UTF-8 bytes.
    email: @OutputOnly The email address of the service account.
    etag: Used to perform a consistent read-modify-write.
    name: The resource name of the service account in the following format:
      `projects/{project}/serviceAccounts/{account}`.  Requests using `-` as a
      wildcard for the project will infer the project from the `account` and
      the `account` value can be the `email` address or the `unique_id` of the
      service account.  In responses the resource name will always be in the
      format `projects/{project}/serviceAccounts/{email}`.
    oauth2ClientId: @OutputOnly. The OAuth2 client id for the service account.
      This is used in conjunction with the OAuth2 clientconfig API to make
      three legged OAuth2 (3LO) flows to access the data of Google users.
    projectId: @OutputOnly The id of the project that owns the service
      account.
    uniqueId: @OutputOnly The unique and stable id of the service account.
  """

  displayName = _messages.StringField(1)
  email = _messages.StringField(2)
  etag = _messages.BytesField(3)
  name = _messages.StringField(4)
  oauth2ClientId = _messages.StringField(5)
  projectId = _messages.StringField(6)
  uniqueId = _messages.StringField(7)


class ServiceAccountKey(_messages.Message):
  """Represents a service account key.  A service account has two sets of key-
  pairs: user-managed, and system-managed.  User-managed key-pairs can be
  created and deleted by users.  Users are responsible for rotating these keys
  periodically to ensure security of their service accounts.  Users retain the
  private key of these key-pairs, and Google retains ONLY the public key.
  System-managed key-pairs are managed automatically by Google, and rotated
  daily without user intervention.  The private key never leaves Google's
  servers to maximize security.  Public keys for all service accounts are also
  published at the OAuth2 Service Account API.

  Enums:
    KeyAlgorithmValueValuesEnum: Specifies the algorithm (and possibly key
      size) for the key.
    PrivateKeyTypeValueValuesEnum: The output format for the private key. Only
      provided in `CreateServiceAccountKey` responses, not in
      `GetServiceAccountKey` or `ListServiceAccountKey` responses.  Google
      never exposes system-managed private keys, and never retains user-
      managed private keys.

  Fields:
    keyAlgorithm: Specifies the algorithm (and possibly key size) for the key.
    name: The resource name of the service account key in the following format
      `projects/{project}/serviceAccounts/{account}/keys/{key}`.
    privateKeyData: The private key data. Only provided in
      `CreateServiceAccountKey` responses.
    privateKeyType: The output format for the private key. Only provided in
      `CreateServiceAccountKey` responses, not in `GetServiceAccountKey` or
      `ListServiceAccountKey` responses.  Google never exposes system-managed
      private keys, and never retains user-managed private keys.
    publicKeyData: The public key data. Only provided in
      `GetServiceAccountKey` responses.
    validAfterTime: The key can be used after this timestamp.
    validBeforeTime: The key can be used before this timestamp.
  """

  class KeyAlgorithmValueValuesEnum(_messages.Enum):
    """Specifies the algorithm (and possibly key size) for the key.

    Values:
      KEY_ALG_UNSPECIFIED: An unspecified key algorithm.
      KEY_ALG_RSA_1024: 1k RSA Key.
      KEY_ALG_RSA_2048: 2k RSA Key.
    """
    KEY_ALG_UNSPECIFIED = 0
    KEY_ALG_RSA_1024 = 1
    KEY_ALG_RSA_2048 = 2

  class PrivateKeyTypeValueValuesEnum(_messages.Enum):
    """The output format for the private key. Only provided in
    `CreateServiceAccountKey` responses, not in `GetServiceAccountKey` or
    `ListServiceAccountKey` responses.  Google never exposes system-managed
    private keys, and never retains user-managed private keys.

    Values:
      TYPE_UNSPECIFIED: Unspecified. Equivalent to
        `TYPE_GOOGLE_CREDENTIALS_FILE`.
      TYPE_PKCS12_FILE: PKCS12 format. The password for the PKCS12 file is
        `notasecret`. For more information, see
        https://tools.ietf.org/html/rfc7292.
      TYPE_GOOGLE_CREDENTIALS_FILE: Google Credentials File format.
    """
    TYPE_UNSPECIFIED = 0
    TYPE_PKCS12_FILE = 1
    TYPE_GOOGLE_CREDENTIALS_FILE = 2

  keyAlgorithm = _messages.EnumField('KeyAlgorithmValueValuesEnum', 1)
  name = _messages.StringField(2)
  privateKeyData = _messages.BytesField(3)
  privateKeyType = _messages.EnumField('PrivateKeyTypeValueValuesEnum', 4)
  publicKeyData = _messages.BytesField(5)
  validAfterTime = _messages.StringField(6)
  validBeforeTime = _messages.StringField(7)


class SetIamPolicyRequest(_messages.Message):
  """Request message for `SetIamPolicy` method.

  Fields:
    policy: REQUIRED: The complete policy to be applied to the `resource`. The
      size of the policy is limited to a few 10s of KB. An empty policy is a
      valid policy but certain Cloud Platform services (such as Projects)
      might reject them.
  """

  policy = _messages.MessageField('Policy', 1)


class SignBlobRequest(_messages.Message):
  """The service account sign blob request.

  Fields:
    bytesToSign: The bytes to sign.
  """

  bytesToSign = _messages.BytesField(1)


class SignBlobResponse(_messages.Message):
  """The service account sign blob response.

  Fields:
    keyId: The id of the key used to sign the blob.
    signature: The signed blob.
  """

  keyId = _messages.StringField(1)
  signature = _messages.BytesField(2)


class StandardQueryParameters(_messages.Message):
  """Query parameters accepted by all methods.

  Enums:
    FXgafvValueValuesEnum: V1 error format.
    AltValueValuesEnum: Data format for response.

  Fields:
    f__xgafv: V1 error format.
    access_token: OAuth access token.
    alt: Data format for response.
    bearer_token: OAuth bearer token.
    callback: JSONP
    fields: Selector specifying which fields to include in a partial response.
    key: API key. Your API key identifies your project and provides you with
      API access, quota, and reports. Required unless you provide an OAuth 2.0
      token.
    oauth_token: OAuth 2.0 token for the current user.
    pp: Pretty-print response.
    prettyPrint: Returns response with indentations and line breaks.
    quotaUser: Available to use for quota purposes for server-side
      applications. Can be any arbitrary string assigned to a user, but should
      not exceed 40 characters.
    trace: A tracing token of the form "token:<tokenid>" to include in api
      requests.
    uploadType: Legacy upload protocol for media (e.g. "media", "multipart").
    upload_protocol: Upload protocol for media (e.g. "raw", "multipart").
  """

  class AltValueValuesEnum(_messages.Enum):
    """Data format for response.

    Values:
      json: Responses with Content-Type of application/json
      media: Media download with context-dependent Content-Type
      proto: Responses with Content-Type of application/x-protobuf
    """
    json = 0
    media = 1
    proto = 2

  class FXgafvValueValuesEnum(_messages.Enum):
    """V1 error format.

    Values:
      _1: v1 error format
      _2: v2 error format
    """
    _1 = 0
    _2 = 1

  f__xgafv = _messages.EnumField('FXgafvValueValuesEnum', 1)
  access_token = _messages.StringField(2)
  alt = _messages.EnumField('AltValueValuesEnum', 3, default=u'json')
  bearer_token = _messages.StringField(4)
  callback = _messages.StringField(5)
  fields = _messages.StringField(6)
  key = _messages.StringField(7)
  oauth_token = _messages.StringField(8)
  pp = _messages.BooleanField(9, default=True)
  prettyPrint = _messages.BooleanField(10, default=True)
  quotaUser = _messages.StringField(11)
  trace = _messages.StringField(12)
  uploadType = _messages.StringField(13)
  upload_protocol = _messages.StringField(14)


class TestIamPermissionsRequest(_messages.Message):
  """Request message for `TestIamPermissions` method.

  Fields:
    permissions: The set of permissions to check for the `resource`.
      Permissions with wildcards (such as '*' or 'storage.*') are not allowed.
      For more information see [IAM
      Overview](https://cloud.google.com/iam/docs/overview#permissions).
  """

  permissions = _messages.StringField(1, repeated=True)


class TestIamPermissionsResponse(_messages.Message):
  """Response message for `TestIamPermissions` method.

  Fields:
    permissions: A subset of `TestPermissionsRequest.permissions` that the
      caller is allowed.
  """

  permissions = _messages.StringField(1, repeated=True)


encoding.AddCustomJsonFieldMapping(
    StandardQueryParameters, 'f__xgafv', '$.xgafv',
    package=u'iam')
encoding.AddCustomJsonEnumMapping(
    StandardQueryParameters.FXgafvValueValuesEnum, '_1', '1',
    package=u'iam')
encoding.AddCustomJsonEnumMapping(
    StandardQueryParameters.FXgafvValueValuesEnum, '_2', '2',
    package=u'iam')
